#!/bin/bash
#SBATCH -J run_polarization     # A single job name for the array
#SBATCH -n 1                    # one core
#SBATCH -N 1                    # on one node
#SBATCH -t 0-24:00:00           # Running time of 2 hours
#SBATCH --mem-per-cpu=32gb      # Memory request
#SBATCH -o stdout/%A_%a.out     # Standard output
#SBATCH -e stderr/%A_%a.err     # Standard error

# This script submits a slurm job for a single config file.  It is called inside of run_array.sh,
# and should not be called directly by the user.

# grab out filename from the array exported from our 'parent' shell
module load anaconda3
module load texlive
source activate eclips_venv

FILES=($(find configs/ -type f))
FILENAME=${FILES[$SLURM_ARRAY_TASK_ID]}

python ~/Documents/repos/eclips/eclips/simulations/poppy/run_polarization_model.py "$FILENAME"
