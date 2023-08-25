#!/usr/bin/env bash
MARIAN_PATH=/home/s1031254/marian-dev/build/marian-decoder
TEST_HOME=/mnt/startiger0/nbogoych/enfr/github_repo/test_set/

echo "Plain"
$MARIAN_PATH -c model.npz.best-bleu.npz.decoder.yml -d 0 1 2 3 -w 8000 --mini-batch 16 --maxi-batch 200 --quiet --quiet-translation -i $TEST_HOME/plain/newstest15.fr -o plain.into.en
sacrebleu -t wmt15 -l fr-en < plain.into.en
echo "TittleCase lc"
$MARIAN_PATH -c model.npz.best-bleu.npz.decoder.yml -d 0 1 2 3 -w 8000 --mini-batch 16 --maxi-batch 200 --quiet --quiet-translation -i $TEST_HOME/tittle_src/newstest15.fr -o tittle.into.en
sacrebleu -lc -t wmt15 -l fr-en < tittle.into.en
echo "TittleCase strict"
sacrebleu $TEST_HOME/tittle_src/newstest15.en < tittle.into.en
echo "UpperCase lc"
$MARIAN_PATH -c model.npz.best-bleu.npz.decoder.yml -d 0 1 2 3 -w 8000 --mini-batch 16 --maxi-batch 200 --quiet --quiet-translation -i $TEST_HOME/upper_src/newstest15.fr -o upper.into.en
sacrebleu -lc -t wmt15 -l fr-en < upper.into.en
echo "UpperCase strict"
sacrebleu $TEST_HOME/upper_src/newstest15.en < upper.into.en
echo "Typos"
$MARIAN_PATH -c model.npz.best-bleu.npz.decoder.yml -d 0 1 2 3 -w 8000 --mini-batch 16 --maxi-batch 200 --quiet --quiet-translation -i $TEST_HOME/typo_src/newstest15.fr -o typo.into.en
sacrebleu -t wmt15 -l fr-en < typo.into.en
echo "Noise"
$MARIAN_PATH -c model.npz.best-bleu.npz.decoder.yml -d 0 1 2 3 -w 8000 --mini-batch 16 --maxi-batch 200 --quiet --quiet-translation -i $TEST_HOME/noise_src_trg/newstest15.fr -o noise.into.en
sacrebleu $TEST_HOME/noise_src_trg/newstest15.en < noise.into.en
