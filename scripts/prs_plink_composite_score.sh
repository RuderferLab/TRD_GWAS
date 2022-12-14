# using PRS-CS output
loo=$1
model=$2
name=LOO_${loo}_norm${model}
out=/data/ruderferlab/projects/biovu/trd/results/prs/202205_updated_MVP_MGB_VU_${name}.0.8n

# compile chr results
cat $out/${name}_prscs_weights_pst_eff_a1_b0.5_phi1e-02_chr* >> $out/${name}.mega_eur_v3.prscs.scores

# get composite scores of individuals per chromosome
plink1.9 \
    --bfile /data/ruderferlab/projects/biovu/data/geno/MEGAV3_0504_2022.EUR.WG \
    --score $out/${name}.mega_eur_v3.prscs.scores 2 4 6 \
    --out $out/${name}.mega_eur_v3.prscs
