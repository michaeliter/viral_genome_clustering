from google.colab import drive
import pandas as pd
import numpy as np

# Load folder
drive.mount("/content/drive", force_remount=True)
folder_path = '/content/drive/My Drive/'

# Load network node table
data_df = pd.read_csv(folder_path+"network_w_db_2/genome_by_genome_overview.csv")

# Annotate time period of each genome (leaving database genomes untouched)
for i in range(data_df.index.size):
  if "ind-" in data_df["Genome"][i]:
    data_df["Order"][i] = "Industrial"
    data_df["Family"][i] = "Industrial"
    data_df["Genus"][i] = "Industrial"
  elif "pre-" in data_df["Genome"][i]:
    data_df["Order"][i] = "Pre-Industrial"
    data_df["Family"][i] = "Pre-Industrial"
    data_df["Genus"][i] = "Pre-Industrial"
  elif "pal" in data_df["Genome"][i]:
    data_df["Order"][i] = "Paleo"
    data_df["Family"][i] = "Paleo"
    data_df["Genus"][i] = "Paleo"

# Annotate lifestyle of each of our genomes (based on id marking by checkv)
data_df["Lifestyle"] = ''
lytic = 0
temperate = 0
for i in range(data_df.index.size):
  if data_df["Genome"][i][-2] == '_' and data_df["Genome"][i][0] == '/':
    data_df["Lifestyle"][i] = "Temperate"
    temperate += 1
  elif data_df["Genome"][i][0] == '/':
    data_df["Lifestyle"][i] = "Lytic"
    lytic += 1
  else:
    data_df["Lifestyle"][i] = "NA"

# Export edited network node table
data_df.to_csv(folder_path+'network_w_db_2/new_gbg_overview.csv', index=False)
