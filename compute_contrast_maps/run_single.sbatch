#!/bin/bash
# model, with a user-specified config file.
#SBATCH -J run_polarization_model
#SBATCH -o 300nm-out
#SBATCH -e 300nm-err
#SBATCH --mem-per-cpu=32gb
#SBATCH -t 1-24:00:00
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --mail-type=all

# This is a simple slurm script that can be used to run a single instance of the polarization
# model.  Useful for debugging purposes.

module load anaconda3
module load texlive

source activate eclips_venv
python ~/Documents/repos/eclips/eclips/simulations/poppy/run_polarization_model.py configs/300nm.ini
