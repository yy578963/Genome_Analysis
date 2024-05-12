#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J tyy_assembly_long_reads
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=assembly_long_reads.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools Flye

for i in {66,72,81};
do 
    flye --nano-raw $home_path/DNA_data/raw_data/long_reads/SRR244130"$i".fastq.gz \
         --out-dir $home_path/DNA_data/assembled_data/SRR244130"$i"/ -g 2g -t 2

done 
