#!/bin/bash
#bam file location
bam_path=YOUR_BAM_PATH
#sapple names
FinalSampleNames=YOUR_FINAL_SAMPLE_NAMES
#Add suffix of ".sort.bam"
FinalSampleNames=( "${FinalSampleNames[@]/%/.sort.bam}" )
#Add prefix of file paths
FinalSampleNames=( "${FinalSampleNames[@]/#/${bam_path}/}" )
input_file_list=${FinalSampleNames[@]}
#Variable for Scaffold names
Scaffold=SCAFFOLD_NAMES
Scaffold+=(dummy)
#Path of the Genome sequence
GenomeFile=YOUR_GENOME_FILE
#Number of thread
thread=100
###Variant calling with samtools (Multi-thread version)
#It takes few days
echo ${Scaffold[@]} | xargs --delimiter=" " -P ${thread} -I {} sh -c "samtools mpileup -r {} -f ${GenomeFile}  ${input_file_list} -ug   | bcftools call -mvO z -o {}.vcf.gz"
