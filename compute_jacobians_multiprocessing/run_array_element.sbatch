#!/bin/bash
#SBATCH -J jacobians            # A single job name for the array
#SBATCH -n 1                    # number of tasks
#SBATCH -c 6  			# Number of cpus per task (2 DMs * 3 control wavelengths)
#SBATCH -N 1                    # number of nodes
#SBATCH -t 1-24:00:00		# Max runtime
#SBATCH --mem-per-cpu=16gb	# Memory per CPU
#SBATCH -o stdout/%A_%a.out     # Standard output
#SBATCH -e stderr/%A_%a.err     # Standard error

# This script submits a slurm job for a single config file.  It is called inside of run_array.sh,
# and should not be called directly by the user.

# grab out filename from the array exported from our 'parent' shell
export OMP_NUM_THREADS=1
module load anaconda3
module load texlive

which python

FILES=($(find configs/ -type f))
FILENAME=${FILES[$SLURM_ARRAY_TASK_ID]}

~/.conda/envs/eclips_venv/bin/python ~/Documents/repos/eclips/eclips/simulations/poppy/compute_jacobian.py "$FILENAME"
