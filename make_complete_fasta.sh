#!/bin/bash

# read in arguments by flag and assign them to variables
while getopts "c:" opt; do
  case $opt in
    c) country="$OPTARG";;
    *) echo "Unknown option: -$opt" >&2; exit 1;;
  esac
done

cd $SCRATCH/${country}_checkv
touch $SCRATCH/complete_genomes/${country}_complete.fa

grep "Complete" quality_summary.tsv | cut -f 1 > complete_seqs.txt
seqIds="complete_seqs.txt"

# Check if both files exist
if [ -e "$seqIds" ]; then
    # Use a while loop to read lines from both files simultaneously
    while IFS= read -r seq; do
        # Process lines from both files (replace with your own logic)
        grep -A 1 -h --no-group-separator "${seq} " $SCRATCH/${country}_phages.fa >> $SCRATCH/complete_genomes/${country}_complete.fa 
    done < "$seqIds"
else
    echo "File not found."
fi
