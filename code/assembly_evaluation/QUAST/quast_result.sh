#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 8:00:00
#SBATCH -J yyy_quast_result
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=quast_result.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools quast

quast.py $home_path/DNA_data/polished_data/SRR24413065_pilon.fasta \
         -r $home_path/reference/HP126_genome.fasta \
         -o $home_path/DNA_data/assembly_evaluation/QUAST_result/SRR24413065/

quast.py $home_path/DNA_data/polished_data/SRR24413071_pilon.fasta \
         -r $home_path/reference/R7_genome.fasta \
         -o $home_path/DNA_data/assembly_evaluation/QUAST_result/SRR24413071/

quast.py $home_path/DNA_data/polished_data/SRR24413080_pilon.fasta \
         -r $home_path/reference/DV3_genome.fasta \
         -o $home_path/DNA_data/assembly_evaluation/QUAST_result/SRR24413080/
