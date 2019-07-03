#!/bin/bash
#SBATCH -J run_polarization_model
#SBATCH -a 1-5
#SBATCH -o stdout/%a
#SBATCH --mem-per-cpu=32gb
#SBATCH -t 12:00:00
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mail-type=all
module load anaconda3
source activate eclips_venv
module load texlive
cd ~/Documents/repos/eclips/eclips/models/poppy
python run_polarization_model.py configs/config_${SLURM_ARRAY_TASK_ID}.ini
