#!/bin/bash

module purge
module load lefse/1.1

cd /common/claytonlab/ereisher/philzoo/philzoo_1-all/qiime2/picrust/vis-lefse

# Get the path_abun_unstrat.tsv file
cp /common/claytonlab/ereisher/philzoo/philzoo_1-all/qiime2/picrust/results/pathways_out/path_abun_unstrat.tsv.gz /common/claytonlab/ereisher/philzoo/philzoo_1-all/qiime2/picrust/vis-lefse/
gunzip path_abun_unstrat.tsv.gz

# Generate the sample list with conditions
cut /common/claytonlab/ereisher/philzoo/philzoo_1-all/qiime2/PhilMetadata.tsv -f 1,15 > sample_list_type.tsv

# Get the correct format to run LEfSe
python pathway_format.py -i sample_list_type.tsv -r /common/claytonlab/ereisher/philzoo/philzoo_1-all/qiime2/picrust/vis-lefse/path_abun_unstrat.tsv -o path_abun_modified.tsv

python lefse-format_input.py path_abun_modified.tsv path_abun_modified.in -c 1 -s -1 -u 2 -o 1000000
python run_lefse.py /common/claytonlab/ereisher/philzoo/philzoo_1-all/qiime2/picrust/vis-lefse/path_abun_modified.in path_abun_modified.res
python lefse-plot_res.py path_abun_modified.res path_abun_modified.png --title 'Pathway abundance unstrat' --dpi 300 

