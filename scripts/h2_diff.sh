#outpath="/data/ruderferlab/projects/biovu/trd/results/ldsc/h2_diff"
sum1=$1
sum2=$2
out=$3
sumstatpath="/data/ruderferlab/projects/biovu/trd/results/ldsc"
trd_path="/data/ruderferlab/projects/biovu"

cd $sumstatpath/h2_diff

sh $trd_path/trd/scripts/generateDeletevalues_h2.sh ${sumstatpath}/${sum1}.sumstats.gz ${sumstatpath}/${sum2}.sumstats.gz ${out}
sh $trd_path/trd/scripts/compare2Heritabilities.sh ${sum1}.sumstats.gz ${sum2}.sumstats.gz ${out}
