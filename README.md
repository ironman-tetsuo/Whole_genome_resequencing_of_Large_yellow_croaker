# Whole_genome_resequencing_of_Large_yellow_croaker
### Introduction
Large yellow croaker is an economically important fish in China. On this page, We provide the list of datasets and scripts used for the analysis of the large yellow croaker's whole-resequencing.  

### Data source
- Genome sequence of large yellow croaker  
[http://ftp.ensembl.org/pub/release-100/fasta/larimichthys_crocea/dna/](http://ftp.ensembl.org/pub/release-100/fasta/larimichthys_crocea/dna/)
- Raw sequence reads of whole-genome resequencing of large yellow croaker  
DDBJ DRA database under accession number PRJDB10647  

### Softwares and libraries
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)
- [BWA](http://bio-bwa.sourceforge.net/)
- [Samtools](http://www.htslib.org/)
- [VCFtools](http://vcftools.sourceforge.net/man_latest.html)
- [PLINK](https://www.cog-genomics.org/plink/)
- [ADMIXTURE](https://dalexander.github.io/admixture/index.html)
- [SNeP](https://sourceforge.net/projects/snepnetrends/files/binaries/)
- [R](https://www.r-project.org/)
- [maps](https://cran.r-project.org/web/packages/maps/index.html)
- [mapdata](https://cran.r-project.org/web/packages/mapdata/index.html)

### Quality check of FASTQ files
For checking the quality of FASTQ files, use the following script where we use FastQC.
- [run_FastQC.sh](./run_FastQC.sh)  

### Read trimming
For trimming the FASTQ raw reads, use the following script.
- [run_trimmomatic.sh](./run_trimmomatic.sh)  

### Read mapping to the reference genome
For read mapping, sorting and indexing, use the following script.  
- [run_mapping.sh](./run_mapping.sh)  

### Variant calling
For variant calling from BAM files, use the following script.  
- [run_variant-calling.sh](./run_variant-calling.sh)  

### Generation of PED/MAP file
For creating a PED/MAP file from VCF file, use the following commands. PED/MAP file is required for PLINK.   
```
plink --double-id --allow-extra-chr --vcf All.vcf.gz --recode --out All 
plink --allow-extra-chr  --file All --make-bed  --out All --double-id  
```
### Principal component analysis
For performing principal component analysis (PCA), use the following command.
```
plink --allow-extra-chr --bfile ${ped_path}/All --out All --pca 50
```

### ADMIXTURE analysis
For performing ADMIXTURE analysis, use the following command. In this analysis, K is set to a value between 1 and 15.
```
for i in `seq 1 15`; do
admixture --cv=100 -j${thread} ${ped_map_path}/YOUR_BED_FILE.bed ${i} | tee log${i}.out
done
```

### Estimation of effective population sizes
For estimation of effective population sizes, use the following command.
```
SNeP1.1 -maxsnp 100 -t 100 -ped YOUR_PED_FILE.ped
```

### Calculation of Identical-by-State score matrix
For calculation of Identical-by-State (IBS) score matrix, use the following command. From the IBS score matrix, NJ tree can be constructed using MEGA software.
```
plink --autosome-num 24 --allow-extra-chr --bfile ${ped_path}/198samples_BiallelicSNP_max-missing-0.90_MAF-0.05 --out All  --cluster --matrix
```

### Calculation of Fst
for caliculation of Fst, use the following command.
```
vcftools --gzvcf YOUR_VCF.vcf.gz --weir-fst-pop ${group1}.txt --weir-fst-pop ${group2}.txt --out Fst_SNP_${group1}_vs_${group2}
```

### Drawing geographic maps
For drawing geographic maps by using open source library, use the following R scripts.
```
#Load libraries
library(maps)
library(mapdata)
#Draw a map
png("MyMap.png", width=1000, height=1000)
map(col="grey80", border = "grey40", fill = TRUE, xlim = c(100, 150), ylim = c(20, 40), mar = rep(0.1, 4))
dev.off()
```
![mymap.png](mymap.png)








