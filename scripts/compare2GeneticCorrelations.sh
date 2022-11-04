#!/bin/bash

#Run generateDeleteValues.sh first

log1=$1
log2=$2
phen1=$3
phen2=$4
phen3=$5
phen4=$6
output=$7

globalrg1=$(grep "Genetic Correlation:" ${log1}|awk '{printf $3}')
globalrg2=$(grep "Genetic Correlation:" ${log2}|awk '{printf $3}')

#logroot1=$(sed -e 's/.*Logs\///g' -e 's/.log//g' <(echo $log1))
#logroot2=$(sed -e 's/.*Logs\///g' -e 's/.log//g' <(echo $log2))
logroot1=$(echo $log1 | sed -e 's/.*Logs\///g' -e 's/.log//g')
logroot2=$(echo $log2 | sed -e 's/.*Logs\///g' -e 's/.log//g')

echo "$logroot1 and $logroot2"

echo "correlation1: $globalrg1"
echo "correlation2: $globalrg2"

echo "output written to:${output}"

module load Anaconda2
python ~/suicide/scripts/doJackyCompare2GeneticCorrelations.py \
    ./DeleteVals/${logroot1}${phen1}_${phen2}.gencov.delete \
    ./DeleteVals/${logroot2}${phen3}_${phen4}.gencov.delete \
    ./DeleteVals/${logroot1}${phen1}_${phen2}.hsq1.delete \
    ./DeleteVals/${logroot1}${phen1}_${phen2}.hsq2.delete \
    ./DeleteVals/${logroot2}${phen3}_${phen4}.hsq1.delete \
    ./DeleteVals/${logroot2}${phen3}_${phen4}.hsq2.delete $globalrg1 $globalrg2 $output

#echo "Difference estimate:"
#cat ${homeDir}/compare_genetic_correlations/${phen1}_${phen2}_${phen3}_${phen4}

echo ""
