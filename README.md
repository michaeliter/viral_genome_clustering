# viral_genome_clustering
Here lies the code for taking viral metagenome contigs from human gut microbiomes, analyzing them for completeness, and then clustering the complete genomes

## Pipeline:
1. Extract pre-labeled metagenome contigs by country of origin - [get_country_contigs.sh](get_country_contigs.sh)
2. Extract phages from pre-labeled metagenome contigs - [get_phages.sh](get_phages.sh)
3. Sort phages by length - [sort_contigs.py](sort_contigs.py)
4. Analyze phage contigs for completeness and lifestyle using CheckV - [run_checkv.sh](run_checkv.sh)
5. Extract only the complete phage genomes - [make_complete_fasta.sh](make_complete_fasta.sh)
6. Create cluster network for complete genomes using Prodigal for ORF calling and vConTACT2 for clustering based on proteins - [run_prodigal_vcontact2.sh](run_prodigal_vcontact2.sh)
