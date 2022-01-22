#!/bin/bash
# $1 : raw fastq file
# $2 : barcode file
# $3 : methylated output file
# $4 : unmethylated output file

# step 1 : revese_complement the fastq
zcat $1 | ./bin/fastx_reverse_complement -Q33 -z > ${1%.fastq.gz}_rc.fastq.gz 
cat $1  ${1%.fastq.gz}_rc.fastq.gz > ${1%.fastq.gz}_f_and_rc.fastq.gz 

# step 2 : 

zcat ${1%.fastq.gz}_f_and_rc.fastq.gz | ./bin/fastx_trimmer -Q33 -f 12 -l 41 -z > ${1%.fastq.gz}_trimmed.fastq.gz
zcat  ${1%.fastq.gz}_trimmed.fastq.gz | ./bin/fastx_barcode_splitter.pl --bcfile $2 --prefix ${3%_methylated.fastq.gz}_ --bol --exact --suffix .fastq 
cat ${3%_methylated.fastq.gz}_methylated.fastq | gzip - > $3 
cat ${3%_methylated.fastq.gz}_unmethylated.fastq | gzip - > $4

#cleanup

rm ${3%_methylated.fastq.gz}_unmatched.fastq ${1%.fastq.gz}_rc.fastq.gz  ${1%.fastq.gz}_f_and_rc.fastq.gz ${1%.fastq.gz}_trimmed.fastq.gz ${3%_methylated.fastq.gz}_methylated.fastq ${3%_methylated.fastq.gz}_unmethylated.fastq 
