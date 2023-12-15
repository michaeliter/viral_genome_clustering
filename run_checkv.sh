### run_checkv.sh START ###
#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o checkvlog.$JOB_ID
#$ -j y
# Edit the line below to request the appropriate runtime and memory
# (or to add any other resource) as needed:
#$ -l h_rt=24:00:00,h_data=8G
# Add multiple cores/nodes as needed:
#$ -pe shared 8
# Email address to notify
#$ -M $USER
#$ -m bea

# echo job info on joblog:
echo "Job $JOB_ID started on:   " `hostname -s`
echo "Job $JOB_ID started on:   " `date `
echo " "

# read in arguments by flag and assign them to variables
while getopts "s:" opt; do
  case $opt in
    s) file_name="$OPTARG";;
    *) echo "Unknown option: -$opt" >&2; exit 1;;
  esac
done

# load the job environment:
. /u/local/Modules/default/init/modules.sh
module load anaconda3
# To see which versions of anaconda are available use: module av anaconda

# activate an already existing conda environment (CHANGE THE NAME OF THE ENVIRONMENT):
conda activate CONDAENV

# in the following two lines substitute the command with the
# needed command below:
export CHECKVDB=$HOME/checkv-db-v1.5/
mkdir $SCRATCH/checkv_output_$JOB_ID
checkv end_to_end $file_name $SCRATCH/checkv_output_$JOB_ID -t 16

# echo job info on joblog:
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
### run_checkv.sh STOP ###
