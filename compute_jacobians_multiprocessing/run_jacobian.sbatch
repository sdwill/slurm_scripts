#!/bin/bash
#SBATCH -J jac_300
#SBATCH -o stdout_%j
#SBATCH -e stderr_%j
#SBATCH --mem-per-cpu=16gb
#SBATCH -t 1-24:00:00
#SBATCH -n 1
#SBATCH -c 6  # 2 DMs * 3 wavelengths
#SBATCH --mail-type=all
export OMP_NUM_THREADS=1
module load anaconda3
module load texlive
source activate eclips_venv
python ~/Documents/repos/eclips/eclips/simulations/poppy/compute_jacobian.py configs/300nm.ini
