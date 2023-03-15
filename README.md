# A pipeline for reproducible 16S rRNA microbiome analysis

## The main goal of this project is to identify taxa that are associated with a change of fiber in the diet in gorillas
- The first aim of this project is to analyze 16s rRNA samples using a bioinformatics pipeline
- The second aim of the project is to develop written methodology and related background for use in publication 
- The third aim of the project is to make code available for use via Github


## General overview of the modified pipeline used.
![pipeline-overview](https://github.com/ereisher/Capstone/blob/main/pipeline.drawio.png)
The first step is pre-processing the data*, then cleaning the data** and conducting diversity, phylogenetic, and taxonomic analysis*** using QIIME2. Sub-analysis includes running  LEfSe and PICRUSt. The statistical analysis includes diversity alpha and beta group significance, and differential abundance (ANCOM). 
*clean_reads.slurm **dada2.slurm ***diversity_metrics.slurm

## Tools installation and packages available in the [tools file](https://github.com/ereisher/Capstone/blob/main/tools.md).



## Detailed steps in how to run the pipeline is available in the [steps file](https://github.com/ereisher/Capstone/blob/main/steps.md).
Note that the full analysis could be run in HOLLAND COMPUTING CENTER (HHC) (https://hcc.unl.edu/) without the need to install anything except for the step that uses R.

## License
This repo uses the MIT License.
