for i in {65,71,80};
do 
    fastqc -o /home/yute2303/Genome_Analysis/DNA_data/quality_controlled_data/short_reads/ SRR244130"$i"_1.fastq.gz SRR244130"$i"_2.fastq.gz
done
