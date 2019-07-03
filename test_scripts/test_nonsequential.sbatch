#!/bin/bash
# test_nonsequential.sbatch
#
#SBATCH -J run_job  # A single job name for the array
#SBATCH -n 1        # one core
#SBATCH -N 1        # on one node
#SBATCH -t 0-2:00   # Running time of 2 hours
#SBATCH --mem 4000  # Memory request of 4 GB
#SBATCH -o %A_%a.out # Standard output
#SBATCH -e %A_%a.err # Standard error

# grab out filename from the array exported from our 'parent' shell
module load anaconda3
source activate eclips_venv
FILENAME=${FILES[$SLURM_ARRAY_TASK_ID]}
echo $FILENAME