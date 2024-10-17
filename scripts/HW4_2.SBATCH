#!/bin/bash
#SBATCH --job-name=HW4_2.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=mrb339@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=24:00:00
#SBATCH --mem=4G

#---------------environment,loading---------------#
shopt -s expand_aliases
module load trimmomatic

#---------------runtrimmomatic--------------------#
trimmomatic PE \
/home/mrb339/HW4_input_files/EC-12_R1_001.fastq.gz \
/home/mrb339/HW4_input_files/EC-12_R2_001.fastq.gz \
/home/mrb339/HW4_output_files/EC-12_R1_trmPE.fq.gz /home/mrb339/HW4_output_files/EC-12_R1_trmSE.fq.gz \
/home/mrb339/HW4_output_files/EC-12_R2_trmPE.fq.gz /home/mrb339/HW4_output_files/EC-12_R2_trmSE.fq.gz \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:/home/mrb339/HW4_input_files/TruSeq3-PE.fa:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75
