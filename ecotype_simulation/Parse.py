import os
import re
import csv


ecotype_num, file_name = [], []

for filename in os.listdir("output"):
    if ".xml" not in filename:
        continue
    with open("output/" + filename) as file:
        file_name.append(filename)
        for row in file:
            if "<ecotypes size=" in row:
                ecotype_num += (re.findall(
                    "[-+]?[.]?[\d]+(?:,\d\d\d)*[\.]?\d*(?:[eE][-+]?\d+)?", row))
            

header = ["ecotype_size", "file_name"]
with open('ecotype_result.csv', 'w') as file:
    writer = csv.writer(file)
    writer.writerow(header)
    for i in range(len(ecotype_num)):
        data = [ecotype_num[i], file_name[i]]
        writer.writerow(data)