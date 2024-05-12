#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 6:00:00
#SBATCH -J tyy_pilon_file_index
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=pilon_file_index.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools bwa

for i in {65,71,80};
do
    bwa index $home_path/DNA_data/polished_data/SRR244130"$i"_pilon.fasta
done
