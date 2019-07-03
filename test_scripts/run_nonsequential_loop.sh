#!/bin/bash
# grab the files, and export it so the 'child' sbatch jobs can access it

# array=()
# while IFS=  read -r -d $'\0'; do
#     array+=("$REPLY")
# done < <(find configs/ -type f -print0)

export FILES=($(find ~/Documents/repos/eclips/eclips/models/poppy/configs/ -type f))
NUMFASTQ=${#FILES[@]}  # Get size of array

# now subtract 1 as we have to use zero-based indexing (first cell is 0)
ZBNUMFASTQ=$(($NUMFASTQ - 1))

# now submit to SLURM
if [ $ZBNUMFASTQ -ge 0 ]; then
    sbatch --array=0-$ZBNUMFASTQ test_nonsequential.sbatch
fi
