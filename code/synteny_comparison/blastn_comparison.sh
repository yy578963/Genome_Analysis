#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J tyy_blastn_comparison
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=blastn_comparison.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools blast

makeblastdb -in $home_path/DNA_data/polished_data/SRR24413071_pilon.fasta \
            -dbtype nucl -out "$home_path/DNA_data/synteny_comparison/"

blastn -query $home_path/DNA_data/polished_data/SRR24413065_pilon.fasta \
       -db "$home_path/DNA_data/synteny_comparison/" \
       -out "$home_path/DNA_data/synteny_comparison/HP126_to_R7/" -outfmt 6

blastn -query $home_path/DNA_data/polished_data/SRR24413080_pilon.fasta \
       -db "$home_path/DNA_data/synteny_comparison/" \
       -out "$home_path/DNA_data/synteny_comparison/DV3_to_R7/" -outfmt 6


