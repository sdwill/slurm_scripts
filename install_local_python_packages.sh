#!/bin/bash
# This script installs several locally-developed packages of interest for
# running coronagraph simulations (from the eclips repo).  The packages
# are:
#   - proper: for DM functionality and eclips PROPER model
#   - wfscore: for generating segmented-aperture piston/tip/tilt maps
#   - poppy-st: for eclips POPPY model
#   - yapp: for eclips yapp model
#   - eclips: for runnable scripts and associated infrastructure


# Load the anaconda module for python 3
module load anaconda3

# Activate the virtualenv for the eclips sims
source activate eclips_venv

# Save the current directory for later
START_DIR = $(pwd)


# Install local packages
cd ~/Documents/repos/proper
python setup.py develop

cd ~/Documents/repos/wfscore
python setup.py develop

cd ~/Documents/repos/poppy-st
python setup.py develop

cd ~/Documents/repos/yapp
python setup.py develop

cd ~/Documents/repos/eclips
python setup.py develop

# Clean up
source deactivate
cd $(START_DIR)
