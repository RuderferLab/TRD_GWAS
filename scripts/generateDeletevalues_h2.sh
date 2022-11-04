#!/bin/bash

input1=$1
input2=$2
output1=$3
outpath="/data/ruderferlab/projects/biovu/trd/results/ldsc/h2_diff"

ldscoredir=/data/ruderferlab/software/ldsc
pythonpath="python"

cd ${outpath}

module load Anaconda2
$pythonpath $ldscoredir/ldsc.py  --n-blocks 200 --print-delete-vals --rg ${input1},${input2} --ref-ld-chr $ldscoredir/ref/eur_w_ld_chr/ --w-ld-chr $ldscoredir/ref/eur_w_ld_chr/ --out ${output1}

mv $outpath/*.log $outpath/Logs/
mv $outpath/*.delete $outpath/DeleteVals/
