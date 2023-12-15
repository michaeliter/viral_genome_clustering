from Bio import SeqIO
from sys import argv

# Get the lengths and ids, and sort on length
len_and_ids = sorted(
    (len(rec), rec.id) for rec in SeqIO.parse(argv[1], "fasta")
)
ids = reversed([id for (length, id) in len_and_ids])

del len_and_ids  # free this memory
record_index = SeqIO.index(argv[1], "fasta")
records = (record_index[id] for id in ids)
SeqIO.write(records, "sorted_" + argv[1], "fasta")
