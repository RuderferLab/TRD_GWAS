file=$1
name=$2

ldsc=/data/ruderferlab/software/ldsc
module load Anaconda2

python ${ldsc}/munge_sumstats.py \
--merge-alleles ${ldsc}/ref/w_hm3.snplist \
--sumstats ${file} \
--N-col NMISS \
--out /data/ruderferlab/projects/biovu/trd/results/ldsc/${name}

python ${ldsc}/ldsc.py \
--h2 /data/ruderferlab/projects/biovu/trd/results/ldsc/${name}.sumstats.gz \
--ref-ld-chr ${ldsc}/ref/eur_w_ld_chr/ \
--w-ld-chr ${ldsc}/ref/eur_w_ld_chr/ \
--out /data/ruderferlab/projects/biovu/trd/results/ldsc/${name}_obsv_h2
