# Structural Variant Detection Pipeline (Manta + Samtools)

A reproducible pipeline for detecting structural variants (SVs) in human sequencing data using Manta and Samtools. The workflow extracts chromosome-specific alignments, identifies large SVs, and generates analysis-ready BED files.

---

## Overview

Structural variants, including deletions and duplications, contribute significantly to genomic variation and disease. This pipeline processes alignment data to identify high-confidence SVs on chromosome 22, producing filtered outputs suitable for downstream analysis.

**Goals:**

- Extract chromosome-specific alignments  
- Convert and index CRAM/BAM files  
- Detect structural variants with Manta  
- Filter large variants (≥1 kb)  
- Generate BED files for downstream analyses  

---

## Workflow

### 1. Data Preparation
- Link project directories for efficient access  
- Load required bioinformatics tools  

### 2. Alignment Extraction
- Extract chromosome 22 reads from CRAM files  
- Convert CRAM → BAM using samtools  
- Index BAM for downstream processing  

### 3. Structural Variant Calling
- Configure Manta for SV detection  
- Run automated workflow to generate VCF files  
- Identify structural variants (DEL, DUP)  

### 4. Variant Filtering
- Retain variants ≥ 1 kb in size  
- Extract deletions (DEL) and duplications (DUP)  
- Convert filtered variants to BED format for downstream use  

### 5. File Conversion & Indexing
- Convert BAM back to CRAM for storage efficiency  
- Index CRAM files for quick access  

---

## Technologies

- Bash (Unix scripting)  
- SLURM (HPC job scheduling)  
- Samtools  
- Manta  

---

## Key Features

- Chromosome-specific structural variant detection  
- Integration of alignment processing and variant calling  
- Filtering of large genomic events  
- Generation of analysis-ready BED files  
- Scalable for HPC environments  

---

## Skills Demonstrated

- Structural variant identification and analysis  
- NGS data handling (CRAM/BAM/VCF/BED)  
- High-throughput data processing  
- Pipeline automation with Bash and HPC job scheduling  
- Variant filtering and data preparation for downstream analysis  

---

## Notes

- Focuses on chromosome 22 for computational efficiency  
- Filters variants ≥ 1 kb to retain high-confidence events  
- BED file outputs contain genomic coordinates of CNVs  
- Designed for reproducible, scalable execution in HPC environments  

---

## Author

**Gagan Heda**
