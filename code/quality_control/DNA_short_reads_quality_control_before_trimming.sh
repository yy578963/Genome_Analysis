#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J tyy_DNA_short_reads_quality_control_before_trimming
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=DNA_short_reads_quality_control_before_trimming.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools FastQC

for i in {65,71,80};
do 
    fastqc -o $home_path/DNA_data/quality_controlled_data/before_trimming/ \
              $home_path/DNA_data/raw_data/short_reads/SRR244130"$i"_1.fastq.gz \
              $home_path/DNA_data/raw_data/short_reads/SRR244130"$i"_2.fastq.gz
done
