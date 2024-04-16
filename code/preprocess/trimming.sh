for i in {65,71};
do
    trimmomatic PE SRR244130"$i"_1.fastq.gz SRR244130"$i"_2.fastq.gz -baseout /home/yute2303/Genome_Analysis/DNA_data/preprocessed_data/short_reads/SRR244130"$i"_trim.fq.gz \
    ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
