#!/bin/bash
#SBATCH --partition=debug  --time=00:01:00  --output=tmp.log

python check_hostname.py
