#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J tyy_htseq_R7_to_R7
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=htseq_R7_to_R7.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools htseq

for i in {62..64};
do
    htseq-count -f bam -r pos -t CDS -i ID $home_path/RNA_data/mapped_data/R7_to_R7/SRR245164"$i".bam \
                $home_path/DNA_data/annotated_data/PROKKA_result/SRR24413071/SRR24413071_prokka_filtered.gff \
                > $home_path/RNA_data/features_counting_result/Htseq_result/SRR245164"$i".txt
done 
