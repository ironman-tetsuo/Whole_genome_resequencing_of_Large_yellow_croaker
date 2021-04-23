# Whole_genome_resequencing_of_Large_yellow_croaker
### Introduction
On this page, I provide the list of datasets and scripts used for the analysis of the large yellow croaker's whole-resequencing.  
<br />

### Data source
- Genome sequence of large yellow croaker  
ftp://ftp.ensembl.org/pub/release-100/fasta/larimichthys_crocea/dna/Larimichthys_crocea.L_crocea_2.0.dna_sm.toplevel.fa.gz
- Raw sequence reads of whole-genome resequencing of large yellow croaker  
DDBJ database under accession number PRJDB10647  
<br />

### Quality check of FASTQ files
For checking the quality of FASTQ files, use the following script where we use FastQC.
- [run_FastQC.sh](./run_FastQC.sh)  
<br />

### Read trimming
For trimming the FASTQ raw reads, use the following script.
- [run_trimmomatic.sh](./run_trimmomatic.sh)  
<br />

### Read mapping to the reference genome
For read mapping, sorting and indexing, use the following script.  
- [run_mapping.sh](./run_mapping.sh)  
<br />

### Variant calling
For variant calling from BAM files, use the following script.  
- [run_variant-calling.sh](./run_variant-calling.sh)  
<br />

### Generation of ped/map
`plink --double-id --allow-extra-chr --vcf All.vcf.gz --recode --out All`  
`plink --allow-extra-chr  --file All --make-bed  --out All --double-id`  
<br />









