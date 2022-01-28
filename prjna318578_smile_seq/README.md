# MAX dataset

We used MAX round 1 (R1; [SRR3405065](ftp.sra.ebi.ac.uk/vol1/fastq/SRR340/005/SRR3405065/SRR3405065.fastq.gz)) data. For round 0 data, we contacted Alina Isakova, the first author of [SMiLE-seq](https://www.nature.com/articles/nmeth.4143) paper. Of the input fastq 

```
grep -A2 -B1  "^TAATGCG" Input_smile_seq_1.fastq | sed 's:--::g' | sed '/^$/d'> SRR3405065.r0.fastq
```
