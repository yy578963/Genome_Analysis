#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J tyy_MUMmerplot_result
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=MUMmerplot_result.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools MUMmer

nucmer --prefix=$home_path/DNA_data/assembly_evaluation/MUMmerplot_result/SRR24413065 \
       $home_path/reference/HP126_genome.fasta \
       $home_path/DNA_data/polished_data/SRR24413065_pilon.fasta
show-coords -rcl $home_path/DNA_data/assembly_evaluation/MUMmerplot_result/SRR24413065.delta \
            > $home_path/DNA_data/assembly_evaluation/MUMmerplot_result/SRR24413065.coords

nucmer --prefix=$home_path/DNA_data/assembly_evaluation/MUMmerplot_result/SRR24413071 \
       $home_path/reference/R7_genome.fasta \
       $home_path/DNA_data/polished_data/SRR24413071_pilon.fasta
show-coords -rcl $home_path/DNA_data/assembly_evaluation/MUMmerplot_result/SRR24413071.delta \
            > $home_path/DNA_data/assembly_evaluation/MUMmerplot_result/SRR24413071.coords

nucmer --prefix=$home_path/DNA_data/assembly_evaluation/MUMmerplot_result/SRR24413080 \
       $home_path/reference/DV3_genome.fasta \
       $home_path/DNA_data/polished_data/SRR24413080_pilon.fasta
show-coords -rcl $home_path/DNA_data/assembly_evaluation/MUMmerplot_result/SRR24413080.delta \
            > $home_path/DNA_data/assembly_evaluation/MUMmerplot_result/SRR24413080.coords
