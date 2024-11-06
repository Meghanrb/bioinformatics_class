# Detailed project workflow
## This is the flow of an NGS analysis. Actual code examples are in scripts folder.
This is the flow of an NGS analysis:

![IMG_9280](https://github.com/user-attachments/assets/f7efbb48-428e-419b-805b-ed3786e999b6)

1. Get your FASTQC file from your sequencing analysis. FASTQC performs quality checks on data to detect any possible problems.
   - Example: <img width="642" alt="Screen Shot 2024-10-18 at 7 38 46 AM" src="https://github.com/user-attachments/assets/f5361328-b28a-49c4-a35a-cc508b5a62c1">  ![image](https://github.com/user-attachments/assets/b2d7f028-66bb-41e7-bb52-e1e224b76f8d)
   - Header Information:
      EAS139 the unique instrument name 
      136 the run id 
      FC706VJ the flowcell id 
      2 flowcell lane 
      2104 tile number within the flowcell lane 
      15343 'x'-coordinate of the cluster within the tile
      197393 'y'-coordinate of the cluster within the tile 
      1 the member of a pair, 1 or 2 (paired-end or mate-pair reads only)
      Y Y if the read is filtered, N otherwise 
      18 0 when none of the control bits are on, otherwise it is an even number 
      ATCACG index sequence
  - Phred score will tell you the base call accurancy/probability of incorrect base.
2. Clean your FASTQC files with trimmomatic
  - Commonly used commands are….
  - 	LEADING:10 cut bases at beggining of read if below a specified quality threshold
  - 	 RAILING:10 cut bases at end of read if below specified quality threshold
  - 	 HEADCROP:6 cuts the specified number of bases from the start of the read
  - 	 SLIDINGWINDOW:4:15 cut when average quality within the window falls below a threshold
  - 	 ILLUMINACLIP:adapters_file.fa:2:30:10 Remove Illumina adapters (reference adapters in fasta)
  - 	 MINLEN:75 remove the read if it is below a specified length
Genome analysis:
<img width="986" alt="Screen Shot 2024-10-24 at 8 58 52 AM" src="https://github.com/user-attachments/assets/c2f22aaa-d0db-46f1-987e-9e060d9eb29d">
1. Genome fasta (.fna files) --> nucleotides
2. Annotated genome (.gff files).
3. Bedtools --> takes smaller .gff files and the genome fasta and creates a small fasta seperated from the way the .gff file is seperated.

RNA-seq:
1. Map (align) reads to reference (Bowtie2) -> sam/bam file
2. Count Reads per gene model (HTseq)
3. Differential expression analysis (DEseq2 in R)
4. Gene Ontology Enrichment Analysis

 

