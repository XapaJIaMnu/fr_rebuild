#!/usr/bin/env bash
#Usage ./vocab.sh en de path-to-corpora char-cov vocab_size

char_cov=1 #${4:-'0.9995'} # Default char coverage
vocab_size=32000 ${5:-'32000'} # Default vocab size
# Set up some constants

# Language pairs
src=en
trg=fr
prefix="--model_prefix=model.nounicode.${src}-${trg}"

# Placeholders array
# placeholders="--user_defined_symbols=__source__,__target__,__done__,__start__,__end__"

# Character coverage. CJK is recommended to have 0.9995, vocab languages proabbly you want 1.
char_cov="--character_coverage=${char_cov}"

# First clone and compile SPM
spm_exec="sentencepiece/build/src/spm_train"
if [ ! -e ${spm_exec} ]; then
    git clone https://github.com/google/sentencepiece.git
    cd sentencepiece
    mkdir build
    cd build
    cmake ..
    make -j4
    cd ..
    cd ..
    if [ ! -e ${spm_exec} ]; then
        echo "Failed to compile sentencepiece"
        exit 1
    fi
fi

$spm_exec --bos_id=-1 --eos_id=0 --unk_id=1 ${placeholders} ${char_cov} ${prefix} --vocab_size=${vocab_size} --input=/mnt/startiger0/nbogoych/enfr/dedup/clean.med,/mnt/startiger0/nbogoych/enfr/dedup/clean --input_sentence_size=5000000 --shuffle_input_sentence #--input_format=tsv seems broken
