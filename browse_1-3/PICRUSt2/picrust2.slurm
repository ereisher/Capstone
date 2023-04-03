#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=64000
#SBATCH --time=12:00:00
#SBATCH --job-name=picrust_analysis
#SBATCH --partition=batch,guest
#SBATCH --error=/common/claytonlab/ereisher/capstone/browse_1-3/qiime2/errpi.out
#SBATCH --output=/common/claytonlab/ereisher/capstone/browse_1-3/qiime2/stdpi.out
#SBATCH --open-mode=append


cd /common/claytonlab/ereisher/browse_1-3/qiime2/picrust


module load picrust2/2.4

picrust2_pipeline.py -s /common/claytonlab/ereisher/capstone/browse_1-3/qiime2/exports/rep-seqs/dna-sequences.fasta -i /common/claytonlab/ereisher/capstone/browse_1-3/qiime2/exports/table/feature-table-w-taxa.biom -o results
