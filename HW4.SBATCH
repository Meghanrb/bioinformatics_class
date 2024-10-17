#!/bin/bash
#SBATCH --job-name=HW4.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=mrb339@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=24:00:00
#SBATCH --mem=4G

#---------------environment,loading---------------#
shopt -s expand_aliases
module load trimmomatic

#test: EC-12_R1_001.fastq

#-----------define variables w/file locations-------#
adapters =/home/mrb339/HW4_input_files/TruSeq3-PE.fa

input_R1=/home/mrb339/HW4_input_files/EC-12_R1_001.fastq.gz
input_R2=/home/mrb339/HW4_input_files/EC-12_R2_001.fastq.gz

output_R1_PE=/home/mrb339/HW4_output_files/EC-12_R1_trmPE.fq.gz
output_R1_SE=/home/mrb339/HW4_output_files/EC-12_R1_trmSE.fq.gz

output_R2_PE=/home/mrb339/HW4_output_files/EC-12_R2_trmPE.fq.gz
output_R2_SE=/home/mrb339/HW4_output_files/EC-12_R2_trmSE.fq.gz
#---------------runtrimmomatic--------------------#
trimmomatic PE \
$input_R1 \
$input_R2 \
$output_R1_PE $output_R1_SE \
$output_R2_PE $output_R1_SE \
LEADING:10 \
TRAILING:10 \
ILLUMINACLIP:$adapaters:2:30:10 \
SLIDINGWINDOW:4:15 \
MINLEN:75

module unload trimmomatic
