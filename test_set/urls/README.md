# URL Testset


The testset is generated from the Paracrawl v9 raw en-fr release.

Scanning through the dataset, we select sentences containing URLs.
From these, only sentences that have the same set of URLs on the source and target side are kept.
Pairs are discard if total URL content of either sentence exceeds 50% of the characters.
Identical source and target are also omitted.
We perform deduplication based on the bifixer hash, and select the example with largest bifixer score; in the event that there are multiple examples with the same score, a single example is randomly chosen from that set.

Of the remaining sentence pairs, we sort the URLs such that the longest length is first, and assign a placeholder, sequentially from 1 of the form `[URL{id}]`.
The URLs are replaced in the source and target sentences with the corresponding placeholder string.
The URLs are written to a string, separated by a new-line character, such that the first line contains the URL with `id` 1.
The base64-encoded representation of this string is generated and kept alongside the sentence pair in the TSV file with the format:`{src}\t{trg}\t{b64_urls}`.
We run bicleaner-ai on the TSV output, and write a fourth column containing the bicleaner score.

Finally, we run the scored TSV through a filter that selects bicleaner-ai scores above 0.8.
We maintain a list of the base64-encoded URLs passing this filter, and use it to omit URL-duplicates.

Urls only produced with:
```bash
grep -Eho "https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-\w\d()@:%’_\+.~#?&//=,]*)" paracrawl.urls.v2.en > paracrawl.urls.only.v2.en
```
The reason why there are more lines is because there are multiple urls in some lines


