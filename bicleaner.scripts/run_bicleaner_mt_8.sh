#!/usr/bin/env bash
#conda init bash
#conda activate bicleaner-ai

export BICLEANER_AI_THREADS=4
#export CUDA_VISIBLE_DEVICES=$3
input=`realpath $1`
output=$2
model=bitextor/bicleaner-ai-full-en-fr
tmp=tmp.`basename $1`

mkdir $tmp
cd $tmp
split -n l/8 < $input

i=0
for data in xaa  xab  xac  xad  xae  xaf  xag xah
do
    CUDA_VISIBLE_DEVICES=$i bicleaner-ai-classify $data $model --disable_hardrules --disable_porn_removal --disable_minimal_length --scol 1 --tcol 2 | opuscleaner-threshold --ge 0.5 cut -f3 | cut -f1,2 > $i.$data.filtered &
    let i++
done
