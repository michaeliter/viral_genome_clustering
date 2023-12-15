# viral_genome_clustering
Here lies the code for taking viral metagenome contigs from human gut microbiomes, analyzing them for completeness, and then clustering the complete genomes

## Pipeline:
1. Extract phages from pre-labeled metagenome contigs - [get_phages.sh](get_phages.sh)
2. Sort phages by length - 
3. Analyze phage contigs for completeness and lifestyle using CheckV -
4. Extract only the complete phage genomes -
5. Create cluster network for complete genomes using vConTACT2 - 
