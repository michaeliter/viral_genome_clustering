import pandas as pd
import numpy as np
from Bio import SeqIO

# read in complete genomes extracted from CheckV, as well as list of proviruses and lytic viruses
seq_ids = pd.read_csv("complete_seqs.txt", header=None)
proviruses = list(SeqIO.parse("proviruses.fna", "fasta"))
lytic_viruses = list(SeqIO.parse("viruses.fna", "fasta"))

# for each genome, find its proviruses or record its lytic viruses without host contamination
complete_data = []
for seq in seq_ids[0]:
  check1 = seq + "_"
  check2 = seq + " "
  count = 0
  for record in proviruses:
    if check1 in record.id or check2 in record.id:
      count += 1
      complete_data.append(record)
  if count > 0:
    print(count)
  else:
    for record in lytic_viruses:
      if seq == record.id:
        complete_data.append(record)
        count += 1
    if count == 0:
      print(f"Something went wrong with contig {seq}")

# output set of complete viral genomes (with host contamination removed)
SeqIO.write(complete_data, "genomes_complete_cut.fa", "fasta")
