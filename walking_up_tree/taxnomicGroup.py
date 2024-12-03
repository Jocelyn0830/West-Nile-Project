import csv
    # Bird groups based on taxonomic classification
accipitriformes = [
    "accipiter cooperii", "accipiter gentilis", "accipiter striatus", 
    "buteo jamaicensis", "ferruginous hawk", "red-shouldered hawk", "black vulture",
    "red-tailed hawk", "sharp-shinned hawk", "bald eagle", "ca condor", 
    "cooper's hawk", "coopers hawk", "haliaeetus leucocephalus", "hawk",
    "red shouldered hawk", "red tailed hawk", "sharp shinned hawk", "swainson's hawk"
]

strigiformes = [
    "athene noctua", "bubo virginianus", "great horned owl", 
    "short-eared owl", "short eared owl"
]

falconiformes = ["falco sparverius", "american kestrel", "falco"]

passeriformes = [
    "acrocephalus dumetorum", "american robin", "baeolophus bicolor", "ca scrub jay",
    "cardinalis cardinalis", "carduelis tristis", "carpodacus mexicanus", "sturnidae",
    "catbird", "common grackle", "euphagus cyanocephalus", "brewer's blackbird",
    "garrulus glandarius", "house finch", "house sparrow", "jay", "yellow billed magpie", 
    "jaybird", "magpie", "northern cardinal", "northern mockingbird", 
    "oak titmouse", "poecile atricapilla", "quiscalus quiscula", "pica hudsonia", "pica pica", 
    "raven", "sparrow", "spinus tristis", "tree swallow", "magpie", "haemorhous mexicanus",
    "western bluebird", "barn swallow", "western scrub jay", "boat tailed grackle",
    "western scrub-jay", "grackle (quiscalus quiscula)", "black billed magpie", "red headed tanager",
    "corvus corone", "corvus frugilegus", "corvus ossifragus", "crow", "passer domesticus",
    "turdus merula", "turdus migratorius"
]

charadriiformes = [
    "calidris alba", "charadrius melodus", "larus delawarensis", 
    "larus michahellis", "larus smithsonianus", "spotted sandpiper", 
    "sternula", "gull", "least tern", "piping plover", "ring billed gull"
]

columbiformes = [
    "collared dove", "columba livia", "columba palumbus", 
    "mourning dove", "zenaida macroura"
]

anseriformes = ["anas platyrhynchos", "branta canadensis", "canada goose"]

american_crow = ["american crow", "corvus brachyrhynchos"]

blue_jay = ["blue jay", "bluejay", "cyanocitta cristata", "cyanocitta cristata (blue jay)"]

other_birds = [
    "american white pelican", "brown pelican", "costa's hummingbird", 
    "double crested cormorant", "egretta garzetta", "pelecanus", "pelecanus erythrorhynchos", 
    "phalacrocorax auritus", "phalacrocorax carbo", "phalacrocorax carbo (l.)", 
    "sick stork", "lorii", "flamingo", "gallus gallus", "goose", "ruffed grouse",
    "loriidae sp. (loriinae subfamily)", "loriini", "bird", "phalacrocorax carbo (l.)."
]


# mosquitoes

aedes_and_ochlerotatus = [
    "aedes albopictus",      # Asian tiger mosquito
    "aedes cinereus",        # Unbanded mosquito
    "aedes sp.",             # Unspecified Aedes
    "aedes vexans",          # Inland floodwater mosquito
    "ae. cinereus",          # Synonymous with "aedes cinereus"
    "ochlerotatus cantator", # Brown salt marsh mosquito
    "ochlerotatus sollicitans", # Eastern salt marsh mosquito
    "ochlerotatus sticticus",   # Woodland pool mosquito
    "ochlerotatus triseriatus", # Treehole mosquito
    "ochlerotatus trivittatus"  # Floodwater mosquito
]

anopheles = [
    "anopheles messeae", # Common malaria vector in Eurasia
    "anopheles sp."      # Unspecified Anopheles
]

culex = [
    "culex pipiens restuans complex",
    "culex erythrothorax",        # Tule mosquito
    "culex nigripalpus",          # Southern house mosquito
    "culex perexiguus",           # Egyptian mosquito
    "culex pipiens",              # Common house mosquito
    "culex pipiens male",         # Male of the common house mosquito
    "culex pipiens pipiens",      # Northern house mosquito
    "culex pipiens pool",         # Pooled sample of Culex pipiens
    "culex pipiens quinquefasciatus", # Southern house mosquito
    "culex pipiens-restuans complex", # Hybrid or unidentified complex
    "culex pipiens/restuans",     # Similar to above
    "culex quinq.",               # Abbreviated Culex quinquefasciatus
    "culex quinquefasciatus",     # Southern house mosquito
    "culex restuans",             # Western encephalitis mosquito
    "culex salinarius",           # Salt marsh mosquito
    "culex sp.",                  # Unspecified Culex
    "culex stigmatosoma",         # Banded-wing mosquito
    "culex tarsalis",             # Western encephalitis mosquito
    "culex. pipiens",             # Variant of "culex pipiens"
    "culex. tarsalis"             # Variant of "culex tarsalis"
]

culiseta = [
    "culiseta melanura",  # Black-tailed mosquito
    "culiseta sp.",       # Unspecified Culiseta
    "cs. melanura",       # Synonymous with "culiseta melanura"
    "cs. morsitans"       # Possible synonym for another species
]

psorophora_and_coquillettidia = [
    "psorophora ferox",   # White-footed mosquito
    "ps. ferox",          # Variant of "psorophora ferox"
    "psorophora sp.",     # Unspecified Psorophora
    "coquillettidia sp.", # Unspecified Coquillettidia
    "cq. perturbans"      # Likely Coquillettidia perturbans (cattail mosquito)
]

groups = {
    "Aedes and Ochlerotatus": aedes_and_ochlerotatus,
    "Anopheles": anopheles,
    "Culex": culex,
    "Culiseta": culiseta,
    "Psorophora and Coquillettidia": psorophora_and_coquillettidia,
    "Accipitriformes": accipitriformes,
    "Strigiformes": strigiformes,
    "Falconiformes": falconiformes,
    "Passeriformes": passeriformes,
    "Charadriiformes": charadriiformes,
    "Columbiformes": columbiformes,
    "Anseriformes": anseriformes,
    "Other Birds": other_birds,
    "American Crow": american_crow,
    "Blue Jay": blue_jay
}



to_write = []
with open('metadata_filtered.csv', encoding='utf-8-sig') as file:
    reader = csv.reader(file)
    to_write.append(next(reader))
    #next(reader)
    for row in reader:
        
        row[6] = row[6].lower()
        row[6] = row[6].replace("-", " ")
        row[6] = row[6].rstrip()

        for group_name, species_list in groups.items():
            if row[6] in map(str.lower, species_list):
                row.append(group_name)
        
        to_write.append(row)

with open('metadata_add_group.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerows(to_write)



