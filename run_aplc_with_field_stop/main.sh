#!/bin/bash

# Run job array using config files in configs/ directory.  A separate job is
# created for each configuration file.  This is the main script for submitting multiple scripts
# in parallel.
#
# This script assumes that this file is in the current working directory of the calling shell.

# Find .ini files and export array so that subshell reading sbatch script can access it
FILES=($(find configs/ -type f))
NUMFASTQ=${#FILES[@]}  # Get size of array

# Subtract 1 from length to get max index
ZBNUMFASTQ=$(($NUMFASTQ - 1))

if [ $ZBNUMFASTQ -ge 0 ]; then
    sbatch --array=0-$ZBNUMFASTQ run_array_element.sbatch  # Submit array job to slurm
fi
