#!/bin/bash
#SBATCH -J compute_jacobian
#SBATCH -o stdout_%j
#SBATCH --mem-per-cpu=16gb
#SBATCH -t 1-24:00:00
#SBATCH -n 1
#SBATCH -c 6
#SBATCH --mail-type=all

# Python's multiprocessing module will run a separate process on each core.
# If OMP_NUM_THREADS is > 1 and OpenMP is used somewhere internally,
# then the total number of threads is OMP_NUM_THREADS * (num_multiprocessing_threads)
export OMP_NUM_THREADS=1

# Load the Python 3 anaconda module
module load anaconda3

# Load virtual environment for eclips
source activate eclips_venv
python repos/eclips/eclips/models/poppy/compute_jacobian.py
