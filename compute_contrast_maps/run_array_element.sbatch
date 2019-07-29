#!/bin/bash
#SBATCH -J compute_contrast     # A single job name for the array
#SBATCH -n 20                   # Number of cores
#SBATCH -N 1                    # Number of nodes
#SBATCH -t 0-24:00:00           # Maximum runtime [DAYS]-[HOURS]:[MINUTES]:[SECONDS]
#SBATCH --mem-per-cpu=8gb       # Memory request
#SBATCH -o stdout/%A_%a.out     # Standard output
#SBATCH -e stderr/%A_%a.err     # Standard error

# This script submits a slurm job for a single config file.  It is called inside of run_array.sh,
# and should not be called directly by the user.

# grab out filename from the array exported from our 'parent' shell
module load anaconda3
module load texlive
export GIT_PYTHON_GIT_EXECUTABLE=~/.conda/envs/eclips_venv/bin/git

FILES=($(find configs/ -type f))
FILENAME=${FILES[$SLURM_ARRAY_TASK_ID]}

~/.conda/envs/eclips_venv/bin/python ~/Documents/repos/eclips/eclips/simulations/poppy/compute_contrast_sam.py "$FILENAME"
