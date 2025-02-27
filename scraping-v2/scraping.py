#!/usr/bin/env python
# coding: utf-8

# import necessary packages
import pandas as pd
import numpy as np

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver import ChromeOptions
import time


# check database
driver = webdriver.Chrome()
driver.get("https://www.ncbi.nlm.nih.gov/labs/virus/vssi/#/virus?SeqType_s=Nucleotide&VirusLineage_ss=West%20Nile%20virus,%20taxid:11082&Completeness_s=complete")
driver.implicitly_wait(0.5)

# seq_names = driver.find_elements(by=By.CLASS_NAME, value="refseq-link")
driver.quit()

# load downloaded FASTA file
sequences = open("sequences.fasta", "r").read()
sequnces_list = sequences.split(sep="\n")
# sequnces_list[:500]

# parse sequence names
seq_name = []
for seq in sequnces_list:
    if len(seq) != 0 and seq[0] == ">":
        stop = seq.find(" ")
        seq_name.append(seq[1:stop])
seq_name[:5], len(seq_name)

# initialize web crawler
# set headless to speed up
df = pd.DataFrame(columns=['Name', 'TITLE', 'source'])

options = ChromeOptions()
options.add_argument("--headless=new")

driver = webdriver.Chrome(options=options)

# parse HTML webpage data
for name in seq_name:
    print(name)
    url = "https://www.ncbi.nlm.nih.gov/nuccore/" + name
    driver.get(url)
    driver.implicitly_wait(0.5)
    
    # get metadata
    full_txt = driver.find_element(By.XPATH, '/html/body/div[1]/div[1]/form/div[1]/div[4]/div/div[5]/div[2]/div[1]/div/div/pre').text
    TITLE = full_txt[full_txt.find("TITLE"):full_txt.find("JOURNAL")][6:]
    source = []
    temp = full_txt[full_txt.find("source"):].split(sep="\n")
    source.append(temp[0][7:])
    for i in temp[1:]:
        if i[5] != " ":
            break
        source.append(i)
    
    # save into dataframe
    df = pd.concat([df, pd.DataFrame([[name, TITLE, "".join(source)]], columns=df.columns)], ignore_index=True)
df.head()
df.to_excel("metadata.xlsx")


# check size
df.shape

# parse metadata into corresponding fields
df2 = df.copy()
for index, row in df2.iterrows():
    temp = row["source"]
    temp = temp[temp.find("/")+1:].split("                     /")
    for i in temp:
        if i.find("=") == -1:
            continue
        key, value = i.split("=", maxsplit=1)
        df2.loc[index, key] = value

# drop origin text to save space
df2.drop(columns=["source"]).to_excel("metadata.xlsx")
df2.shape
