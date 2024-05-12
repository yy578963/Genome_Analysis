#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J tyy_DNA_reads_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=DNA_reads_mapping.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools bwa samtools

for i in {66,72,81};
do
    j=$((i - 1))
    bwa index $home_path/DNA_data/assembled_data/SRR244130"$i"/assembly.fasta
    bwa mem $home_path/DNA_data/assembled_data/SRR244130"$i"/assembly.fasta \
            $home_path/DNA_data/preprocessed_data/SRR244130"$j"_trim_1P.fq.gz \
            $home_path/DNA_data/preprocessed_data/SRR244130"$j"_trim_2P.fq.gz \
    | samtools sort - -o $home_path/DNA_data/mapped_data/SRR244130"$j".bam 
    samtools index $home_path/DNA_data/mapped_data/SRR244130"$j".bam    
done
