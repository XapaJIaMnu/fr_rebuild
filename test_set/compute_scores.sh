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
echo "Noise only CHRF"
$TEST_HOME/nonascii.py <  noise.into.en > noise.only.into.en
sacrebleu $TEST_HOME/noise_src_trg/newstest15.nonascii.en -m chrf < noise.only.into.en
echo "Emoji"
$MARIAN_PATH -c model.npz.best-bleu.npz.decoder.yml -d 0 1 2 3 -w 8000 --mini-batch 16 --maxi-batch 200 --quiet --quiet-translation -i $TEST_HOME/emoji_src_trg/newstest15.fr -o emoji.into.en
sacrebleu $TEST_HOME/emoji_src_trg/newstest15.en < emoji.into.en
echo "Emoji only CHRF"
$TEST_HOME/nonascii.py <  emoji.into.en > emoji.only.into.en
sacrebleu $TEST_HOME/emoji_src_trg/newstest15.emoji.en -m chrf < emoji.only.into.en
echo "Urls"
$MARIAN_PATH -c model.npz.best-bleu.npz.decoder.yml -d 0 1 2 3 -w 8000 --mini-batch 16 --maxi-batch 200 --quiet --quiet-translation -i $TEST_HOME/urls/paracrawl.urls.v2.fr -o urls.into.en
sacrebleu $TEST_HOME/urls/paracrawl.urls.v2.en < urls.into.en
echo "urls_only"
grep -Eho "https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-\w\d()@:%’_\+.~#?&//=,]*)" urls.into.en > urls.only.en
sacrebleu $TEST_HOME/urls/paracrawl.urls.only.v2.en < urls.only.en
