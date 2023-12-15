#!/bin/bash

# read in arguments by flag and assign them to variables
while getopts "s:" opt; do
  case $opt in
    s) sample="$OPTARG";;
    *) echo "Unknown option: -$opt" >&2; exit 1;;
  esac
done

# get only phages from all fasta files for sample type
zgrep -A 1 --no-group-separator 'phage' $SCRATCH/${sample}_contigs/*.fa.gz | sed '1~2s/^/>/' \
| sed 's/^[[:alpha:]].*gz://' | sed 's/ /,/g' | sed 's/>//2' > $SCRATCH/all_${sample}_phages.fa
