#!/bin/bash

#location of demultiplexed fastq files 
DEMUXED_DATA="/path/to/fastq/files/"

#creates CSV file to populate                              
echo "Sample,Reads" >> ${DEMUXED_DATA}/read_count.csv

#loop iterating all read 1 files in folder
for f in ${DEMUXED_DATA}/*R1_001*; do
	#opening file, counting total numbers of lines divided by 4
	CMD="$(zcat $f | echo $((`wc -l`/4)))"
        #printing only fastq file name, not absolute path, read counts to read_count.csv
  	echo "${f##*/},$CMD" >> ${DEMUXED_DATA}/read_count.csv
done
