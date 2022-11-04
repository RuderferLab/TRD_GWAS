#!/bin/bash

homeDir=/data/ruderferlab/projects/biovu/trd/results/ldsc/h2_diff
f1=${homeDir}/Logs/${out}.log

if [[ ! -f $f1 ]]; then
sum1=$1
sum2=$2
out=$3
f1=${homeDir}/Logs/${out}.log
fi;

globalh1=$(grep "Total Observed scale h2:" ${f1}|head -n 1|awk '{printf $5}')
globalh2=$(grep "Total Observed scale h2:" ${f1}|tail -n 1|awk '{printf $5}')

echo "heritability phenotype $phen1: $globalh1"
echo "heritability phenotype $phen2: $globalh2"

echo "output written to:${homeDir}/compare_heritabilities/${out}"

module load Anaconda2
python /data/ruderferlab/projects/suicide/scripts/doJackyCompare2Heritabilities.py \
    ${homeDir}/DeleteVals/${out}${sum1}_${sum2}.hsq1.delete \
    ${homeDir}/DeleteVals/${out}${sum1}_${sum2}.hsq2.delete \
    $globalh1 $globalh2 ${homeDir}/compare_heritabilities/${out}

echo "Difference estimate:"
cat ${homeDir}/compare_heritabilities/${out}

echo ""
