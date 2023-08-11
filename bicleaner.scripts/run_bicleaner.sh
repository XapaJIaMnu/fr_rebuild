#!/usr/bin/env bash
#conda init bash
#conda activate bicleaner-ai

export BICLEANER_AI_THREADS=4
export CUDA_VISIBLE_DEVICES=$3
input=$1
output=$2
model=bitextor/bicleaner-ai-full-en-fr

bicleaner-ai-classify $input $model --disable_hardrules --disable_porn_removal --disable_minimal_length --scol 1 --tcol 2 | opuscleaner-threshold --ge 0.5 cut -f3 | cut -f1,2 > $output
