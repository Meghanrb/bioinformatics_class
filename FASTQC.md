# This is the code that i used for FASTQC
## HW2
1. Recall that we have a “Google bucket” set up as a data file repository for this class.  The name of the bucket  is “gu-biology-dept-class”. For a refresher on this, see the end of the “Class#3” PowerPoint slides.

1a. What files are currently located in the google bucket?
[mrb339@grapes-controller ~]$ gsutil ls gs://gu-biology-dept-class

gs://gu-biology-dept-class/aegypti_query_albo
gs://gu-biology-dept-class/albo_query_aegypti
gs://gu-biology-dept-class/recip_best_hit_blast.py
gs://gu-biology-dept-class/small_example.fastq
gs://gu-biology-dept-class/small_practice.fq
gs://gu-biology-dept-class/test1.txt


1b. Copy the file “test1.txt” from the google bucket to your netid directory on the cherries-controller.  What is the text in this file when you use “less” or “more” to view the file?


[mrb339@grapes-controller ~]$  gsutil cp gs://gu-biology-dept-class/test1.txt . 
Copying gs://gu-biology-dept-class/test1.txt...
/ [1 files][   21.0 B/   21.0 B]                                                
Operation completed over 1 objects/21.0 B.                                       
[mrb339@grapes-controller ~]$ head test1.txt
This is test file #1

“This is test file#1” is the text in the file test1.txt


2. Transfer the FASTQ file “small_practice.fq” from the course google bucket to your netID directory. (note: this file is different from “small_example.fastq” that we used in class).


2a. How many total sequences are in this file?

[mrb339@grapes-controller ~]$ wc small_practice.fq
  99472  124340 9214060 small_practice.fq

99472/4 = 24,868

There are 24,868 sequences in the file.


2b. What are the Phred quality scores (numerical values, not ascii codes) for the first two quality scores of the FIRST sequence in the file (assume Illumina 1.9 coding) ? 

Both Phred quality scores are 1 (so 1 & 1)


2c.  How many sequences in the file were produced by the library with the barcode (=index) “ATTCAGAA+GCCTCTAT”?

[mrb339@grapes-controller ~]$ grep "ATTCAGAA+GCCTCTAT" small_practice.fq | wc -l
23775

There were 23,775 sequences produced by the library with the above barcode


2d. How many sequences in the file were produced by the library with the barcode (=index) “ATTCAGAA+GCCTCTAG”?

[mrb339@grapes-controller ~]$ grep "ATTCAGAA+GCCTCTAG" small_practice.fq | wc -l
80


There were 80 sequences produced by the library with the above barcode


2e. Use a command-line code to determine how many sequences in the file were produced by libraries with barcodes OTHER THAN "ATTCAGAA+GCCTCTAT" and “ATTCAGAA+GCCTCTAG”. You might need to use a couple different commands and you’ll also need to use the “pipe” (|) for at least some of your commands.

[mrb339@grapes-controller ~]$ grep "@" small_practice.fq > hw2_2
[mrb339@grapes-controller ~]$ grep -v -e "ATTCAGAA+GCCTCTAT" -e "ATTCAGAA+GCCTCTAG" hw2_2 | wc -l
1013

There are 1,013 sequences in the file produced by libraries with barcodes other than the ones listed above. 



2f. Use your answers from 2a, 2c and 2d to verify the result you obtained in 2e.

23,775 + 80 + x = 24,868 where x is the answer for 2e. 
X = 1,013
