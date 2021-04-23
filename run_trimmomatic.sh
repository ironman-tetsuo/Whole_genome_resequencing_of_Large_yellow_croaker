#!/bin/bash
#Declare the variable for all names of sample names
SampleNames=YOUR_SAMPLE_NAME
#Declare the variable for all paths of sample names
SamplePATH=YOUR_SAMPLE_PATH
#Run Trimmomatic for all samples
Length=`echo ${#SampleNames[@]}-1 | bc`
for i in `seq 0 ${Length}`; do
java -jar trimmomatic-0.36.jar PE -phred33 -threads 40 -trimlog \
${SampleNames[${i}]}.log.txt \
${SamplePATH[${i}]}/Clean/${SampleNames[${i}]}/${SampleNames[${i}]}_1.fq.gz \
${SamplePATH[${i}]}/Clean/${SampleNames[${i}]}/${SampleNames[${i}]}_2.fq.gz \
${SampleNames[${i}]}_1.paired.fastq.gz \
${SampleNames[${i}]}_1.unpaired.fastq.gz \
${SampleNames[${i}]}_2.paired.fastq.gz \
${SampleNames[${i}]}_2.unpaired.fastq.gz \
TRAILING:30 LEADING:30 SLIDINGWINDOW:4:25 MINLEN:50 2> ${SampleNames[${i}]}.stderr.txt
done
