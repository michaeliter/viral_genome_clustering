# viral_genome_clustering
Here lies the code for taking viral metagenome contigs from human gut microbiomes, analyzing them for completeness, and then clustering the complete genomes

## Pipeline:
1. Extract pre-labeled metagenome contigs by country of origin - [get_country_contigs.sh](get_country_contigs.sh)
2. Extract phages from pre-labeled metagenome contigs - [get_phages.sh](get_phages.sh)
3. Sort phages by length - [sort_contigs.py](sort_contigs.py)
4. Analyze phage contigs for completeness and lifestyle using CheckV - [run_checkv.sh](run_checkv.sh)
5. Extract only the complete phage genomes - [make_complete_fasta.sh](make_complete_fasta.sh)
6. Remove host contamination from genomes using CheckV outputs - [cut_complete_genomes.py](cut_complete_genomes.py)
7. Create cluster network for complete genomes using Prodigal for ORF calling and vConTACT2 for clustering based on proteins - [run_prodigal_vcontact2.sh](run_prodigal_vcontact2.sh)
8. Edit network node table to include info about our genomes' time periods and lifestyles - [annotate_network.py](annotate_network.py)

## Analyses:
1. Lifestyle Frequencies by Time Period: <img width="1282" alt="lifestyle_freqs" src="https://github.com/michaeliter/viral_genome_clustering/assets/42823460/6428194c-d679-47f0-b9de-e19d57459f40">
2. Network Colored by Time Period
   - grey = database
   - red = industrial
   - blue = pre-industrial
   - green = paleo

<img width="754" alt="time_w_db" src="https://github.com/michaeliter/viral_genome_clustering/assets/42823460/da701959-928a-4b6d-9033-8e693a721735">

3. Network Colored by Lifestyle
   - grey = database
   - purple = lytic
   - orange = temperate
     
<img width="755" alt="life_w_db" src="https://github.com/michaeliter/viral_genome_clustering/assets/42823460/0593d1da-1341-4e70-a604-5b6fde21d04e">

4. Edge Lengths By Time Period
<img width="1269" alt="Screen Shot 2024-03-22 at 12 58 57 PM" src="https://github.com/michaeliter/viral_genome_clustering/assets/42823460/8a073a69-834b-4fd7-a199-4760336a182b">

5. Edge Counts By Time Period
<img width="1278" alt="Screen Shot 2024-03-21 at 10 02 35 PM" src="https://github.com/michaeliter/viral_genome_clustering/assets/42823460/5e7703d8-09d5-4fe3-a6d0-a4b1d62a1d54">


6. Average Neigbor Composition By Time Period
<img width="1231" alt="Screen Shot 2024-03-21 at 10 02 14 PM" src="https://github.com/michaeliter/viral_genome_clustering/assets/42823460/0582731f-3f33-4ec6-84c3-fc2468527944">
<img width="1173" alt="Screen Shot 2024-03-21 at 10 02 06 PM" src="https://github.com/michaeliter/viral_genome_clustering/assets/42823460/8e7e9ddb-2b5c-4d59-814d-cfa6fe74fe40">
<img width="1197" alt="Screen Shot 2024-03-21 at 10 01 58 PM" src="https://github.com/michaeliter/viral_genome_clustering/assets/42823460/5436c1a9-46e3-4ab3-b59b-1b3becb6afe5">

7. Outlier Frequency By Time Period
<img width="1186" alt="Screen Shot 2024-03-22 at 1 11 12 PM" src="https://github.com/michaeliter/viral_genome_clustering/assets/42823460/ebd9d9e7-595c-4f55-b362-e2935c6c89ee">










