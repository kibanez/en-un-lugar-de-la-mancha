#!/bin/bash
  
if [[ $# -eq 0 ]] ; then
    echo 'Three arguments are required: 1) The path of the folder containing PASS FASTQ files (minKNOW), 2) the output folder of the resulting trimming and filtering, and 3) the Q score (by default is 10)'
    exit 1
fi

# Input arguments
FASTQ_PASS_FOLDER=$1
FASTQ_PASS_HIGHQUAL_FOLDER=$2
Q_SCORE=$3

for i in ${FASTQ_PASS_FOLDER}/*.fastq*; do
        echo ${i}
        NAME_FILE="${i##*/}"
        OUTPUT_NEW_FASTQ=${FASTQ_PASS_HIGHQUAL_FOLDER}/${NAME_FILE}_highQual.fastq.gz
        #echo ${NAME_FILE}
        #echo ${OUTPUT_NEW_FASTQ}
        NanoFilt -q 10 ${i} | gzip > ${OUTPUT_NEW_FASTQ}
done
