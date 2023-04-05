1. Pre-process the data using FastQC and MultiQC- files can be found in the [Pre-process folder](https://github.com/ereisher/Capstone/tree/main/Preprocess)
    - Run 'bash get_sample_name_dic.sh > sample_dic.txt' in order to get the sample list where each accession number separated by space
    - Copy the sample_dic.txt to the qc.slurm for the 'sample_name' variable
    - Make directory called 'qc' and make a sub-directory called 'script_output'
    - Run qc.slurm

2. Run Qiime2- files can be found in the qiime2 folder (each group has their own files)
    - Make directory called 'qiime2' and make sure QIIME2 version 2021.4 installed with all of the plugins.
    - Build the manifest file using the 'manifest_builder.py' by specifiying -i acc_list_file -p path_to_the_raw_reads
    - Get the latest release for the reference database (SILVA).
    - Make sure these files are included in the 'qiime2' directory: metadata.tsv, manifest, and reference database
    - Run 'sbatch clean_reads.slurm'
    - Run'sbatch dada2.slurm'
    - Run 'sbatch diversity_metrics.slurm'
   
3. Normalization using SRS (scaling with ranked subsampling) method:
    - Upload the 'table.qza' to the SRS Shiny app (https://vitorheidrich.shinyapps.io/srsshinyapp/) in order to choose a sampling depth (Cmin)
    - Add Cmin to line 7 in the 'normalized_srs.sh' script.
    - Run 'bash normalized_srs.sh' from the 'qiime2' directory
    
4. Create relative abundance plots (heatmap and barplot)- files can be found in the R folder (each group has their own files)
    - Install R version 4.1.2 and create a directory called 'qiime2_output'.
    - Note * At this time, HCC does not support the R packages needed for this step
    - Download the 'Heatmap-barplot.R', 'metadata.tsv', 'table.qza', 'taxonomy.qza' to the 'qiime2_output' directory.
    - Download the 'Heatmap-barplot.R', 'metadata.tsv', 'norm-table.qza', 'taxonomy.qza' to the 'qiime2_norm_output' directory.
    - Run 'Heatmap-barplot.R'.
  
5. Run sub-analysis: LEfSe, and PICRUSt2
    - LEfSe analysis steps- files can be found in the LEfSe folder (each group has their own files)
        * Install LEfSe version 1.0.
        * Make a sub-directory to 'qiime2' called 'lefse'.
        * Go to the lefse directory and make sure both 'format_rel_level.sh' and 'rel_format.py' are available in the directory.
        * Run 'format_rel_level.sh'
    - PICRUSt2 analysis steps- files can be found in the PICRUSt2 folder (each group has their own files)
        * Install PICRUSt2 version 2.4.
        * Make a sub-directory to 'qiime2' called 'picrust'.
        * Make sure 'picrust2.slurm'is available in the directory.
        * Once the scripted finish create a directory called 'vis-lefse' and make sure both 'format_pathway_abun.sh', and 'pathway_format.py' are available in the directory.
        * Run 'format_pathway_abun.sh'.

6. Running correlation and statistical analysis: alpha and beta group significant, and differential abundance (ANCOM)
    - Alpha and beta group significant- files can be found in the Stat folder (each group has their own files)
        * Make a sub-directory to the 'qiime2' called 'stat' and make sure it includes 'stat.slurm' and a sub-dirctury called 'script_output'.
        * Run 'sbatch stat.slurm'
    - Differential abundance (ANCOM)- files can be found in the ANCOM folder (each group has their own files)
        * Make a sub-directory to the 'qiime2' called 'ancom' and make sure it includes 'ancom.sh'.
        * Run 'bash ancom.sh'.
