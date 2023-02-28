#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem=85000
#SBATCH --time=10:00:00
#SBATCH --job-name=qc
#SBATCH --partition=batch
#SBATCH --error=/work/claytonlab/ereisher/philzoo/qc/script_output/err.out
#SBATCH --output=/work/claytonlab/ereisher/philzoo/qc/script_output/std.out
#SBATCH --open-mode=append


############################################
# Run fastQC for multiple samples
############################################


module load fastqc/0.11

cd /work/claytonlab/ereisher/philzoo/raw_reads/raw_reads

declare -a sample_name=(SRR20140307 SRR20140308 SRR20140309 SRR20140310 SRR20140311 
                        SRR20140312 SRR20140313 SRR20140314 SRR20140315 SRR20140316 SRR20140317 
                        SRR20140318 SRR20140319 SRR20140320 SRR20140321 SRR20140322 SRR20140323 
                        SRR20140324 SRR20140325 SRR20140326 SRR20140327 SRR20140328 SRR20140329 
                        SRR20140330 SRR20140331 SRR20140332 SRR20140333 SRR20140334 SRR20140335 SRR20140336)

echo "Started QC"
for i in ${sample_name[@]}; do
	fastqc $i"_1.fastq" -o /work/claytonlab/ereisher/philzoo/qc
	fastqc $i"_2.fastq" -o /work/claytonlab/ereisher/philzoo/qc
done
echo "Finishied QC"


############################################
# Run multiqc for all fastQC results
############################################

# Run multiqc in order to look at the QC of the data in one report. 
cd /work/claytonlab/ereisher/philzoo/qc
module load multiqc/py37/1.8
mkdir multiqc
echo "Started multiqc"
multiqc *_fastqc.zip -o multiqc/
echo "Finishied multiqc"
