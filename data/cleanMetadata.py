import sys
import csv
import os
from collections import defaultdict

cur_dir = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(cur_dir))

from util import FastaToDict

core_genome = FastaToDict.fastaToDict("core_genome/core_genome_outgroup_filtered.fa")

birds = [
    "accipiter cooperii", "accipiter gentilis", "accipiter striatus", "acrocephalus dumetorum",
    "american crow", "crow", "american kestrel", "american robin", "american white pelican",
    "anas platyrhynchos", "athene noctua", "baeolophus bicolor", "bald eagle", "passer domesticus",
    "barn swallow", "black vulture", "black billed magpie", "blue jay", "bluejay", "pelecanus",
    "cyanocitta cristata", "boat tailed grackle", "branta canadensis", "brewer's blackbird", "phalacrocorax carbo (l.).",
    "brown pelican", "bubo virginianus", "buteo jamaicensis", "ca condor", "ca scrub jay", "phalacrocorax carbo",
    "calidris alba", "canada goose", "cardinalis cardinalis", "carduelis tristis", "pelecanus erythrorhynchos",
    "carpodacus mexicanus", "catbird", "charadrius melodus", "colaptes auratus", "collared dove",
    "columba livia", "columba palumbus", "common grackle", "cooper's hawk", "coopers hawk",
    "corvus brachyrhynchos", "corvus corone", "corvus frugilegus", "corvus ossifragus", "sturnidae",
    "costa's hummingbird", "double crested cormorant", "egretta garzetta", "euphagus cyanocephalus", "hawk",
    "falco sparverius", "ferruginous hawk", "flamingo", "gallus gallus", "garrulus glandarius",
    "great horned owl", "grackle (quiscalus quiscula)", "larus delawarensis", "larus michahellis", "haliaeetus leucocephalus",
    "larus smithsonianus", "house finch", "house sparrow", "ictinia mississippiensis", "cyanocitta cristata (blue jay)",
    "jaybird", "least tern", "magpie", "northern cardinal", "northern mockingbird", "falco", "haemorhous mexicanus",
    "oak titmouse", "pica hudsonia", "pica pica", "piping plover", "poecile atricapilla", "bird",
    "red shouldered hawk", "red tailed hawk", "ring billed gull", "sharp shinned hawk", "jay", "lorii", "loriini",
    "short eared owl", "sparrow", "spinus tristis", "spotted sandpiper", "swainson's hawk", "gull",
    "tree swallow", "turdus merula", "turdus migratorius", "western bluebird", "goose", "phalacrocorax carbo (l.)."
    "western scrub jay", "yellow billed magpie", "zenaida macroura", "ruffed grouse", "sick stork", "mourning dove",
    "quiscalus quiscula", "raven", "red headed tanager", "sternula", "phalacrocorax auritus"
]

humans = [
    "homo sapiens", "human", "homo sapiens; age: 48; sex: male",
    "human brain", "human plasma", "human plasma"
]

mosquitoes = [
    "ae. cinereus", "aedes albopictus", "aedes cinereus", "aedes sp.", "aedes vexans",
    "anopheles messeae", "anopheles sp.", "coquillettidia sp.", "cq. perturbans",
    "cs. melanura", "cs. morsitans", "culex erythrothorax", "culex nigripalpus",
    "culex perexiguus", "culex pipiens", "culex pipiens male", "culex pipiens/restuans complex",
    "culex quinquefasciatus", "culex restuans", "culex salinarius", "culex sp.", "culex. pipiens",
    "culex stigmatosoma", "culex tarsalis", "culex. tarsalis", "culiseta melanura",
    "culiseta sp.", "hyalomma marginatum", "ochlerotatus cantator", "ochlerotatus sollicitans",
    "ochlerotatus sticticus", "ochlerotatus triseriatus", "ochlerotatus trivittatus", "culex pipiens quinquefasciatus",
    "psorophora ferox", "psorophora sp.", "culex pipiens pool", "mosquito", "culex pipiens/restuans", "ps. ferox"
]

other_species = [
    "alpaca", "camelus dromedarius", "crocodylus niloticus", "equine", "equus caballus",
    "fox squirrel", "horse", "mesocricetus auratus", "mouse", "mus musculus", "oc. canadensis",
    "ornithodoros capensis", "roussetus leschenaultii", "rousettus leschenaultii", "loriidae sp. (loriinae subfamily)",
    "sciurus carolinensis", 
]


core_genome_seq_list = []

for seq in core_genome.keys():
    seq = seq.split()[0]
    seq = seq.replace('>', '')
    core_genome_seq_list.append(seq)

to_write = []
with open('metadata/metadata_new.csv', encoding='utf-8-sig') as file:
    reader = csv.reader(file)
    to_write.append(next(reader))
    #next(reader)
    for row in reader:
        if row[0] in core_genome_seq_list:
            row[6] = row[6].lower()
            row[6] = row[6].replace("-", " ")
            row[6] = row[6].rstrip()
            if row[6] in birds:
                row.append("bird")
            elif row[6] in humans:
                row.append("human")
            elif row[6] in mosquitoes:
                row.append("mosquito")
            elif row[6] in other_species:
                row.append("other_species")
            to_write.append(row)

with open('metadata_filtered.csv', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerows(to_write)



