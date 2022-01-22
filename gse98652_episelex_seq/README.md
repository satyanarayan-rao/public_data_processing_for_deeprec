# Processing EpiSELEX data

## Downlaod fastx toolkit

Please download the appropriate version of fastx toolkit from Hannon Lab
[website](http://hannonlab.cshl.edu/fastx_toolkit/download.html). Extract and
keep the binaries in `bin/` directory.

```
$ sh scripts/raw_fastq_to_selex_compatible.sh raw_data/SRR5515773.fastq.gz metadata/cebp_CTAG_barcode.tsv processed/cebpb_CTAG_r1_methylated.fastq.gz processed/cebpb_CTAG_r1_unmethylated.fastq.gz 
$ sh scripts/raw_fastq_to_selex_compatible.sh raw_data/SRR5515780.fastq.gz metadata/cebp_CTAG_barcode.tsv processed/cebpb_CTAG_r0_methylated.fastq.gz processed/cebpb_CTAG_r0_unmethylated.fastq.gz 
```
