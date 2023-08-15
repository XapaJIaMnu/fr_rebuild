# fr_rebuild
French-English/English-French effort
# Locations
Key files locations:

## OpusCleaner data
`/mnt/startiger0/nbogoych/OpusCleaner/data/train-parts`
## Filtered location
`/mnt/startiger0/nbogoych/enfr/filtered`
## Bicleaned location
`/mnt/startiger0/nbogoych/enfr/bicleaned`
## Dedupped location
`/mnt/startiger0/nbogoych/enfr/dedup`
## FREN location
`/mnt/startiger0/nbogoych/enfr/dedup_fren`
Swap command: `pigz -dc ../dedup/clean.gz | awk -F $'\t' '{print $2 "\t" $1}' OFS=$'\t' | pigz > clean.gz`

# Dataset makeup
## Clean
```bash
cat EUbookshop-v2.en-fr.filters.json.gz Europarl-v8.en-fr.filters.json.gz GlobalVoices-v2018q4.en-fr.filters.json.gz MultiUN-v1.en-fr.filters.json.gz NeuLab-TedTalks-v1.en-fr.filters.json.gz News-Commentary-v9.1.en-fr.filters.json.gz OpenOffice-v2.en-fr.filters.json.gz QED-v2.0a.en-fr.filters.json.gz RF-v1.en-fr.filters.json.gz TED* Tatoeba-v2023-04-12.en-fr.filters.json.gz TildeMODEL-v2018.en-fr.filters.json.gz UNPC-v20090831.en-fr.filters.json.gz  ECDC-v2016-03-16.en-fr.filters.json.gz ELRA-W0149-v1.en-fr.filters.json.gz ELRA-W0201-v1.en-fr.filters.json.gz ELRA-W0301-v1.en-fr.filters.json.gz ELRA-W0305-v1.en-fr.filters.json.gz ELRA-W0307-v1.en-fr.filters.json.gz ELRA-W0308-v1.en-fr.filters.json.gz ELRC*  > ../for_dedup/clean
```
## Clean.Med
```
cat ELRA-W0138-v1.en-fr.filters.json.gz EuroPat-v3.en-fr.filters.json.gz ECB-v1.en-fr.filters.json.gz > ../for_dedup/clean.med
```

## Medium
```
cat Books-v1.en-fr.filters.json.gz ELRA-W0309-v1.en-fr.filters.json.gz EUconst-v1.en-fr.filters.json.gz EMEA-v3.en-fr.filters.json.gz Salome-v1.en-fr.filters.json.gz Tanzil-v1.en-fr.filters.json.gz giga-fren-v2.en-fr.filters.json.gz infopankki-v1.en-fr.filters.json.gz tico-19-v2020-10-28.en-fr.filters.json.gz > ../for_dedup/medium
```
## Dirty
```
cat CCMatrix-v1.en-fr ELITR-ECA-v1.en-fr JRC-Acquis-v3.0.en-fr MultiCCAligned-v1.en-fr PHP-v1.en-fr WikiMatrix-v1.en-fr wikimedia-v20230407.en-fr  zbible-uedin-v1.en-fr DGT-v4.en-fr GNOME-v1.en-fr KDE4-v2.en-fr OpenSubtitles-v2018.en-fr Ubuntu-v14.10.en-fr Wikipedia-v1.0.en-fr zCCAligned-v1.en-frMulti MultiParaCrawl-v7.1.en-fr.filters.json.gz ParaCrawl-v9.en-fr.filters.json.gz
```

# Unused datasets
`XLEnt-v1.2.en-fr` and `LinguaTools-WikiTitles-v2014.en-fr`
