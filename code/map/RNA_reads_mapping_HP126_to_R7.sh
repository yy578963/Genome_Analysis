#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J tyy_RNA_reads_mapping_HP126_to_R7
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=RNA_reads_mapping_HP126_to_R7.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools bwa samtools

for i in {59..61};
do
    bwa mem $home_path/DNA_data/polished_data/SRR24413071_pilon.fasta \
            $home_path/RNA_data/preprocessed_data/SRR245164"$i"_trim_1P.fq.gz \
            $home_path/RNA_data/preprocessed_data/SRR245164"$i"_trim_2P.fq.gz \
    | samtools sort - -o $home_path/RNA_data/mapped_data/HP126_to_R7/SRR245164"$i".bam 
    samtools index $home_path/RNA_data/mapped_data/HP126_to_R7/SRR245164"$i".bam    
done


