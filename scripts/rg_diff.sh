#outpath="/data/ryuderferlab/projects/biovu/trd/results/ldsc/rg_diff"
trait=$1
pgc=$2
sumstatpath="/data/ruderferlab/projects/suicide/results/ldsc/sumstats"
trdpath="/data/ruderferlab/projects/biovu/trd/results/ldsc"

cd $trdpath/rg_diff

# MGB model before and after comparison
model=mgh
pre=202205_updated_MVP_MGB_VU_norm${model}.sumstats.gz # edit with path to meta-analysis
post=norm${model}_cond_bmi.refpop_1kg_eur.gws_5e8.sumstats.gz # edit with path to post-mtcojo

sh ~/trd/scripts/generateDeletevalues.sh \
  ${trdpath}/${pre} \
  $sumstatpath/pgc_gwas/${pgc}.sumstats.gz \
  ${trdpath}/${post} \
  $sumstatpath/pgc_gwas/${pgc}.sumstats.gz \
  pre_norm${model}_${trait} \
  post_norm${model}_cond_bmi_${trait}

sh ~/trd/scripts/compare2GeneticCorrelations.sh \
  Logs/pre_norm${model}_${trait}.log \
  Logs/post_norm${model}_cond_bmi_${trait}.log \
  ${pre} \
  ${pgc}.sumstats.gz \
  ${post} \
  ${pgc}.sumstats.gz \
  pre-post_norm${model}_cond_bmi_${trait}

# VU model before and after comparison
model=vu
pre=202205_updated_MVP_MGB_VU_norm${model}.sumstats.gz
post=norm${model}_cond_bmi.refpop_1kg_eur.gws_5e8.sumstats.gz

sh ~/trd/scripts/generateDeletevalues.sh \
  ${trdpath}/${pre} \
  $sumstatpath/pgc_gwas/${pgc}.sumstats.gz \
  ${trdpath}/${post} \
  $sumstatpath/pgc_gwas/${pgc}.sumstats.gz \
  pre_norm${model}_${trait} \
  post_norm${model}_cond_bmi_${trait}

sh ~/trd/scripts/compare2GeneticCorrelations.sh \
  Logs/pre_norm${model}_${trait}.log \
  Logs/post_norm${model}_cond_bmi_${trait}.log \
  ${pre} \
  ${pgc}.sumstats.gz \
  ${post} \
  ${pgc}.sumstats.gz \
  pre-post_norm${model}_cond_bmi_${trait}
