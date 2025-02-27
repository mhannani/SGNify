#!/bin/bash
urle () { [[ "${1}" ]] || return 1; local LANG=C i x; for (( i = 0; i < ${#1}; i++ )); do x="${1:i:1}"; [[ "${x}" == [a-zA-Z0-9.~-] ]] && echo -n "${x}" || printf '%%%02X' "'${x}"; done; echo; }

echo -e "\nAfter registering at https://sgnify.is.tue.mpg.de/, provide your credentials:"

username=mohamed_hannani@yahoo.com
password=12az45qs78wx

# echo -e "\nDownloading SGNify..."
# wget --post-data "username=$username&password=$password" 'https://download.is.tue.mpg.de/download.php?domain=sgnify&resume=1&sfile=data.zip' -O 'data.zip' --no-check-certificate --continue
# unzip data.zip -d data/
# rm data.zip

# Load conda initialization in current shell session
echo 'source /root/miniconda3/etc/profile.d/conda.sh' | tee -a ~/.bashrc
source /root/miniconda3/etc/profile.d/conda.sh

echo "creating env"
GIT_LFS_SKIP_SMUDGE=1 git submodule update --init --recursive
conda env create -f environment.yml 
eval "$(conda shell.bash hook)"
git submodule update --init --recursive

# echo "activating sgnify env"

# conda activate sgnify

# cd spectre
# echo -e "\nDownload pretrained SPECTRE model..."
# gdown --id 1vmWX6QmXGPnXTXWFgj67oHzOoOmxBh6B
# mkdir -p pretrained/
# mv spectre_model.tar pretrained/
# cd ..

# cp -r data/FLAME2020 spectre/data/FLAME2020
