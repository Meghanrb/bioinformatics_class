#!/bin/bash
#SBATCH --job-name=bedtools_HW6 --output=z01.%x
#SBATCH --mail-type=END,FAIL --mail-user=mrb339@georgetown.edu
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=1 --time=72:00:00
#SBATCH --mem=4G

#-----------------------------------------------------------------------------#
# This script runs bedtools getfasta to pull sequence from full assembly   #
#-----------------------------------------------------------------------------#

module load bedtools

# Location of the input fasta
loc_fasta="/home/mrb339/HW6/input/HW6_fna.fna"

# Location of input bed file (can be bed/gff/vcf) format
loc_bed="/home/mrb339/HW6/input/obp_HW6.gff"

# Location of the output results
loc_output="/home/mrb339/HW6/output/bed_output.fa"

#- RUN bedtools getfasta----------------------------------------------------------------#

bedtools getfasta -fo $loc_output -name \
-fi $loc_fasta \
-bed $loc_bed \

#----------module unload-------------------------------------------------------#
module unload bedtools
#- FIN -----------------------------------------------------------------------#



