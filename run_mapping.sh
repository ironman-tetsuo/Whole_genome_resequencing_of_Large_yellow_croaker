#!/bin/bash
#Declare the variable for all of sample names
#"Dummy" is pseudo-variable for parallelization
SampleNames=YOUR_SAMPLE_NAMES
FinalSampleNames=YOUR_FINAL_SAMPLE_NAMES
#Other variables
GenomeFile="YOUR_GENOME_FILE"
fastq_path="YOUR_FASTQ_FILE"
thread=20
#1. Mapping by BWA
#2. SAM to BAM
#3. Sort BAM
#4. Index BAM
Length=`echo ${#SampleNames[@]}-1 | bc`
for i in `seq 0 ${Length}`; do
bwa mem ${GenomeFile} \
${fastq_path}/${SampleNames[${i}]}_1.paired.fastq.gz \
${fastq_path}/${SampleNames[${i}]}_2.paired.fastq.gz \
-t ${thread} \
| samtools view -@ ${thread} -h -bS | samtools sort -@ ${thread} > ${FinalSampleNames[${i}]}.sort.bam
samtools index ${FinalSampleNames[${i}]}.sort.bam
done
