trait=$1
pgc=$2
sumstatpath="/data/ruderferlab/projects/suicide/results/ldsc/sumstats"
trdpath="/data/ruderferlab/projects/biovu/trd/results/ldsc"
vu=202205_updated_MVP_MGB_VU_normvu.sumstats.gz #edit for path to VU model meta-analysis
mgb=202205_updated_MVP_MGB_VU_normmgh.sumstats.gz # edit for path to MGB model meta-analysis

sh ~/trd/scripts/generateDeletevalues.sh \
  $trdpath/$vu \
  $sumstatpath/pgc_gwas/${pgc}.sumstats.gz \
  $trdpath/$mgb \
  $sumstatpath/pgc_gwas/${pgc}.sumstats.gz \
  trd_vu_meta_${trait} \
  trd_mgh_meta_${trait}

sh ~/trd/scripts/compare2GeneticCorrelations.sh \
  Logs/trd_vu_meta_${trait}.log \
  Logs/trd_mgh_meta_${trait}.log \
  $vu \
  ${pgc}.sumstats.gz \
  $mgb \
  ${pgc}.sumstats.gz \
  trd_vu_mgh_${trait}
