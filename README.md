# A pipeline for reproducible 16S rRNA microbiome analysis

## The main goal of this project is to identify taxa that are associated with a change of fiber in the diet in gorillas
- The first aim of this project is to analyze 16s rRNA samples using a bioinformatics pipeline
- The second aim of the project is to develop written methodology and related background for use in publication 
- The third aim of the project is to make code available for use via Github


## General overview of the modified pipeline used.
![pipeline-overview](https://github.com/zalsafwani/thesis/blob/621d1302af242417919a21142b0ac8aa846ecc04/Microbiome%20Analysis%20Pipeline.png)
The first step is pre-processing the data with FastQC, MultiQC, then run QIIME2 to import the data, demux, and remove adapter (cutadapt). Running QIIME2 involv running DADA2, diversity analysis, phylogenetic analysis, and taxonomic analysis. The sub-analysis includes running two tools LEfSe and PICRUSt. The statistical analysis includes diversity alpha and beta group significant, and differential abundance (ANCOM). * (part1.slurm), ** (part2.slurm), and ***(part3.slurm).

## Tools installation and packages available in the [tools file](https://github.com/clayton-lab/BugSeq-er/blob/main/Tools.md).



## Detailed steps in how to run the pipeline is available in the [steps file](https://github.com/clayton-lab/BugSeq-er/blob/main/steps.md).
Note that the full analysis could be run in HOLLAND COMPUTING CENTER (HHC) (https://hcc.unl.edu/) without the need to install anything except for the step that uses .

## License
This repo uses the GNU General Public License v 3.0.
