#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J tyy_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=assembly.out

module load bioinfo-tools flye

for i in {66,72};
do 
    flye --nano-raw SRR244130"$i".fastq.gz --out-dir /home/yute2303/Genome_Analysis/DNA_data/assembled_data/ --threads 2

done 
