### run_vcontact2.sh START ###
#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o /u/scratch/m/miter/prodigal_vcontact2_stuff/logs/pv_log.$JOB_ID
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
conda activate OLDENV

# in the following two lines substitute the command with the
# needed command below:
pDir="/u/scratch/m/miter/prodigal_vcontact2_stuff/prodigal_output_${JOB_ID}"
vDir="/u/scratch/m/miter/prodigal_vcontact2_stuff/vcontact2_output_${JOB_ID}"
mkdir $pDir
mkdir $vDir

~/bin/prodigal -i ${file_name} -o ${pDir}/gene_coords.gbk -a ${pDir}/proteins.faa -p meta
vcontact2_gene2genome -p ${pDir}/proteins.faa -o ${pDir}/protein_map.csv -s Prodigal-FAA
vcontact2 --raw-proteins ${pDir}/proteins.faa --rel-mode 'Diamond' --proteins-fp ${pDir}/protein_map.csv \
--db 'ProkaryoticViralRefSeq201-Merged' --output-dir ${vDir} --pcs-mode MCL \
--vcs-mode ClusterONE --c1-bin ~/bin/cluster_one-1.0.jar   

# echo job info on joblog:
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
### run_vcontact2.sh STOP ###
