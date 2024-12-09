#!/usr/bin/env python
# coding: utf-8

"""
@Author: All code in this file was written by Yang Duan
"""


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns; sns.set()


# In[6]:


# load the dataset
df = pd.read_excel("../scraping-v2/metadata.xlsx", sheet_name="Sheet1")
df.head()


# In[7]:


df["host"].isna().sum()


# In[8]:


# load counts files
count_mosquito = pd.read_excel("counts.xlsx", sheet_name="mosquito")
count_bird = pd.read_excel("counts.xlsx", sheet_name="bird-group")


# In[ ]:





# In[9]:


count_mosquito[["species", "count"]]


# In[17]:


# use subplots for pie charts
fig, (ax1, ax2) = plt.subplots(2,1, figsize = [15, 10])
fig.suptitle('Pie Charts for Host Species')
fig.tight_layout()
fig.subplots_adjust(top=0.9)

ax1.pie(count_mosquito["count"], labels = count_mosquito["species"], autopct='%1.f%%')
ax1.set_title('(a) Mosquito Species')
ax2.pie(count_bird["Count"], labels = count_bird["Taxnomic Group"], autopct='%1.f%%')
ax2.set_title("(b) Bird Species")

fig.savefig("species.png", dpi = 300)


# In[96]:


count_bird[["Taxnomic Group", "Count"]]


# In[ ]:


# check time metadata
# plot bar chart
time_counts = df["collection_time"].apply(lambda x: str(x)[:4]).value_counts()
time_counts.sort_index(inplace=True)
time_counts = time_counts[1:]
plt.bar(time_counts.index, list(time_counts))
plt.title('Bar Plot for Time Metadate of Sequence Data')

plt.xticks(rotation=45)
plt.savefig("time metadata.png")


# In[ ]:


# first attempt to plot pie chart for host species
counts = df['host_species'].value_counts() 

print(counts.to_string())
with pd.ExcelWriter("counts.xlsx") as writer:  
    for host in ["mosquito", "bird"]: 
        counts = df[df["host"] == host]['host_species'].value_counts() 

        df_counts = pd.DataFrame(data={"species":list(counts.index),"count":list(counts)})
        df_counts.to_excel(writer, sheet_name=host)

plt.pie(df["count"]/ sum(df["count"]), labels = df["species"], autopct='%1.1f%%')
plt.show() 


# In[1]:


# location metadata
# plot pie chart for locations
count_state = df['state'].value_counts()
df_state = pd.DataFrame(data={"State":count_state.index, "Count":list(count_state)})
df_state.loc[41,"State"] = "CT"

# plt.pie(df_state["Count"]/ sum(df_state["Count"]), labels = df_state["State"], autopct='%1.1f%%')
# plt.show() 

df_state_top10 = df_state[:10]
df_state_top10

df_state_top10.loc[-1] = ["Other", sum(df_state[10:]["Count"])]  # adding a row
df_state_top10.index = df_state_top10.index + 1  # shifting index
df_state_top10 = df_state_top10.sort_index()
df_state_top10

plt.pie(df_state_top10["Count"], labels = df_state_top10["State"])
plt.title("Pie Chart for Location Metadata (Top 10 States)") 
# plt.ylabel("Count")
# plt.xlabel("State")

plt.savefig("states (top 10).png")


# In[11]:

# plot histogram for number of ecotypes
df2 = pd.read_csv("../ecotype_simulation/ecotype_result.csv")
plt.hist(df2["ecotype_size"])
plt.xlabel("Number of Ecotypes")
plt.ylabel("Frequency")
# plt.title("Histogram for Numbers of Ecotypes from 500 Simulations")
plt.rcParams["figure.figsize"] = (8,4)
plt.savefig("ecotype.png")


fig, ax = plt.subplots()
df2["ecotype_size"].value_counts().plot(ax=ax, kind='bar')

df2["ecotype_size"].value_counts()


# In[ ]:




