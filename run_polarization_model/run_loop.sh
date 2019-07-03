#!/bin/bash
module load anaconda3
source activate eclips_venv
cd ~/Documents/Research/repos/eclips/eclips/models/poppy

for file in $(find configs/ -type f)
do
    echo $file
    sbatch -J run_polarization_model -o stdout/$SLURM_ARRAY_JOB_ID -e stderr/$SLURM_ARRAY_JOB_ID --mem-per-cpu=32gb -t 16:00:00 -n 1 -c 1 --mail-type=all --wrap="python run_polarization_model.py $file"
    sleep 1
done
