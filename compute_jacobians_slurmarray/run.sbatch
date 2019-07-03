#!/bin/bash
#SBATCH -J compute_jacobian
#SBATCH -o stdout/%a
#SBATCH --mem-per-cpu=16gb
#SBATCH -t 1-24:00:00
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mail-type=all
#SBATCH -a 1-18
module load anaconda3
source activate eclips_venv
python ~/Documents/Research/repos/eclips/eclips/models/poppy/compute_jacobian.py @params/params$SLURM_ARRAY_TASK_ID
