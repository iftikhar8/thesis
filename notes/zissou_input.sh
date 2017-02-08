#! /bin/bash
# Create indexes for reference sequence
#PBS -P 
#PBS -N Index
#PBS -l select=1:ncpus=1:mem=4GB
#PBS -l walltime=00:10:00
#PBS -M steven.hawes@sydney.edu.au
#PBS -m e
#PBS -q small-express

# Load modules
module load bwa
module load samtools

io=/scratch/Project/YourName

# BWA index:
java -jar 
