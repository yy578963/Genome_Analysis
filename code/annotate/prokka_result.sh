#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J yyy_prokka_result
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=prokka_result.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools prokka

for i in {65,71,80};
do
    prokka --outdir $home_path/DNA_data/annotated_data/PROKKA_result/SRR244130"$i"/ \
           --prefix SRR244130"$i"_prokka \
           $home_path/DNA_data/polished_data/SRR244130"$i"_pilon.fasta

done
