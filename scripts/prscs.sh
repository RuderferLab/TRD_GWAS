loo=$1
model=$2
N=$3
name=LOO_${loo}_norm${model}
GWAS_outpath=/data/ruderferlab/projects/biovu/trd/results/meta/202205_updated_MVP_MGB_VU/LOO

echo $GWAS_outpath $N $name

for((i = 1; i < 23; i++)){
nohup python ~/software/PRScs/PRScs.py \
    --ref_dir /data/ruderferlab/software/PRScs/ldblk_1kg_eur \
    --bim_prefix=/data/ruderferlab/projects/biovu/data/geno/MEGAV3_0504_2022.EUR.WG \
    --sst_file=${GWAS_outpath}/${name}.0.8n.prscs \
    --n_gwas=${N} \
    --phi=1e-2 \
    --chrom ${i} \
    --out_dir=/data/ruderferlab/projects/biovu/trd/results/prs/202205_updated_MVP_MGB_VU_${name}.0.8n/${name}_prscs_weights &
}
