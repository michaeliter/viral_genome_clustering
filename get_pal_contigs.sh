#### submit_job.sh START ####
#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o $SCRATCH/job-logs/joblog.pal.$JOB_ID
#$ -j y
## Edit the line below as needed:
#$ -l h_rt=24:00:00,h_data=4G
## Modify the parallel environment
## and the number of cores as needed:
#$ -pe shared 1
# Email address to notify
#$ -M $USER@mail
# Notify when
#$ -m bea

# echo job info on joblog:
echo "Job $JOB_ID started on:   " `hostname -s`
echo "Job $JOB_ID started on:   " `date `
echo " "

## substitute the command to run your code
## in the two lines below:
zgrep -A 1 --no-group-separator 'phage' $SCRATCH/pal_contigs/*.fa.gz | paste - - | awk '{print ">" $1, length($6), $6}' | sort -k2nr | sed 's/ /\n/2g;s/>//2' | sed 's/^\/.*gz://' > $SCRATCH/pal_phages.fa

# echo job info on joblog:
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
#### submit_job.sh STOP ####
