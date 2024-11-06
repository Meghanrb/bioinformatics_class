
#!/bin/bash
#SBATCH --job-name=WTA1.SBATCH --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=mrb339@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=24:00:00
#SBATCH --mem=4G

#---------------environment,loading---------------#
shopt -s expand_aliases
module load trimmomatic

#test: 241031 in-class trimming of assigned files

#-----------define variables w/file locations-------#
adapters=/home/mrb339/class/project/input/TruSeq3-PE.fa

input_R1=/home/mrb339/class/project/input/WTA1_1.fq
input_R2=/home/mrb339/class/project/input/WTA1_2.fq

output_R1_PE=/home/mrb339/class/project/output/WTA1_1.trPE.fq.gz
output_R1_SE=/home/mrb339/class/project/output/WTA1_1.trSE.fq.gz

output_R2_PE=/home/mrb339/class/project/output/WTA1_2.trPE.fq.gz
output_R2_SE=/home/mrb339/class/project/output/WTA1_2.trSE.fq.gz
#---------------runtrimmomatic--------------------#
trimmomatic PE \
$input_R1 \
$input_R2 \
$output_R1_PE $output_R1_SE \
$output_R2_PE $output_R2_SE \
ILLUMINACLIP:$adapters:2:30:10 \
HEADCROP:15 \
TRAILING:20 \
SLIDINGWINDOW:4:15 \
MINLEN:75
