#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J tyy_RNA_reads_trimming
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=RNA_reads_trimming.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools trimmomatic

for i in {56..64};
do
    trimmomatic PE $home_path/RNA_data/raw_data/SRR245164"$i"_1.fastq.gz \
                   $home_path/RNA_data/raw_data/SRR245164"$i"_2.fastq.gz \
                -baseout $home_path/RNA_data/preprocessed_data/SRR245164"$i"_trim.fq.gz \
    ILLUMINACLIP:$home_path/DNA_data/raw_data/short_reads/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
