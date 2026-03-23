#!/bin/bash
#SBATCH -M teach
#SBATCH -A hugen2072-2025s
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=GOH21@pitt.edu
set -ve

ln -s /ix1/hugen2072-2025s/p6/ p6

module load gcc/8.2.0 samtools/1.12

#chromosome 22 alignment
samtools view -T p6/GRCh38_full_analysis_set_plus_decoy_hla.fa \
-bS \
-o NA12778.chr22.bam \
-h p6/NA12778.final.cram chr22

#Indexing it
samtools index NA12778.chr22.bam

#Configuration
python /ihome/crc/install/manta/manta-1.6.0.centos6_x86_64/bin/configManta.py \
--referenceFasta p6/GRCh38_full_analysis_set_plus_decoy_hla.fa \
--bam NA12778.chr22.bam \
--runDir manta_test

cd manta_test
python runWorkflow.py

cd results/variants/

zcat diploidSV.vcf.gz \
| awk '{if ($5 ~ "DEL" || $5 ~ "DUP") print}' \
| awk -F"[\t;]" '{print $1, $2, $8, $5}' OFS="\t" \
| sed 's/END=//g' \
| awk '{if ($3 - $2 >= 1000) print}' > gt1kb.cnv.bed

cd ~/Project6_Ryan/
samtools view -h -o NA12778.chr22.cram NA12778.chr22.bam
samtools index NA12778.chr22.cram

