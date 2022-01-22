import os
import sys
import pandas as pd 
sample_df = pd.read_table("raw_data/samples.tsv")
sample_df.index = sample_df["sample"]
barcode_df = pd.read_table("metadata/barcode_list.tsv")
barcode_df.index = barcode_df["sample"]
rule process_raw_data:
    input:
        raw_fastq_file = lambda wildcards: sample_df.loc[wildcards.sample]["fastq_gz"],
        barcode = lambda wildcards: barcode_df.loc[wildcards.sample]["f"]
        
    params:
    output:
        methylated_fastq = "processed/{sample}_methylated.fastq.gz", 
        unmethylated_fastq = "processed/{sample}_unmethylated.fastq.gz"
    shell:
        "sh scripts/raw_fastq_to_selex_compatible.sh {input.raw_fastq_file}"
        " {input.barcode} {output.methylated_fastq} {output.unmethylated_fastq}"
