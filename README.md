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



