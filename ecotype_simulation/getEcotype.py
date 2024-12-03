import csv
import os
from collections import defaultdict
import xml.etree.ElementTree as ET 
from Bio import Phylo
from ete3 import Tree


def parse_result(filename):
    # built in function to parse xml tree

    tree = ET.parse(filename) 
    root = tree.getroot() 

    ecotype_dict = defaultdict(list)
    for item in root.find("demarcation").find("ecotypes"):
        ecotype_name = item.get("number")
        member_list = item.findall("member")
        name_list = []

        for member in member_list:
            name_list.append(member.get("name"))

        ecotype_dict[ecotype_name] = name_list
    
    return ecotype_dict

ecotype_dict = parse_result("output/result_385.xml")

print(ecotype_dict)
# header = ["ecotype_number", "strain_name"]
# with open('ecotype_demarcation.csv', 'w') as file:
#     writer = csv.writer(file)
#     writer.writerow(header)
#     for ecotype_number, strain_names in ecotype_dict.items():
#         for strain in strain_names:
#             writer.writerow([ecotype_number, strain])

