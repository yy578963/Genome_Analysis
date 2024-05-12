#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 12:00:00
#SBATCH -J tyy_polish
#SBATCH --mail-type=ALL
#SBATCH --mail-user yuyan.teng.2303@student.uu.se
#SBATCH --output=polish.out

home_path="/home/yute2303/Genome_Analysis"

module load bioinfo-tools Pilon

for i in {65,71,80};
do
    j=$((i + 1))
    java -jar /sw/bioinfo/Pilon/1.24/rackham/pilon.jar \
         --genome $home_path/DNA_data/assembled_data/SRR244130"$j"/assembly.fasta \
         --frags $home_path/DNA_data/mapped_data/SRR244130"$i".bam \
         --output $home_path/DNA_data/polished_data/SRR244130"$i"_pilon \
         > $home_path/DNA_data/polished_data/SRR244130"$i"_pilon.log 
done

