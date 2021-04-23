#!/bin/bash
#Declare the variable for all names of sample names
SampleNames=YOUR_SAMPLE_NAMES
#Declare the variable for all paths of sample names
SamplePATH=YOUR_SAMPLE_PATH
#Run FastQC with parallelization
Length=`echo ${#SampleNames[@]}-1 | bc`
for i in `seq 0 ${Length}`; do
fastqc --nogroup -o ./ ${SamplePATH[${i}]}/Clean/${SampleNames[${i}]}/${SampleNames[${i}]}_1.fq.gz
fastqc --nogroup -o ./ ${SamplePATH[${i}]}/Clean/${SampleNames[${i}]}/${SampleNames[${i}]}_2.fq.gz
done
