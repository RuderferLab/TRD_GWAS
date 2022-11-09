outpath=$1
file1=$2
file2=$3
file3=$4
file4=$5
meta_out=$6

echo "
GENOMICCONTROL OFF
AVERAGEFREQ  ON
MINMAXFREQ  ON
FREQLABEL A1FREQ
CUSTOMVARIABLE TN
LABEL TN as N
# === DESCRIBE AND PROCESS THE 1 th INPUT FILE ===
MARKER SNP
ALLELE A1 A2
FREQ A1FREQ
EFFECT BETA
SCHEME STDERR
STDERR SE
PROCESS ${file1}

# === DESCRIBE AND PROCESS THE 2 th INPUT FILE ===
PROCESS ${file2}

# === DESCRIBE AND PROCESS THE 3 th INPUT FILE ===
PROCESS ${file3}

# === DESCRIBE AND PROCESS THE 4 th INPUT FILE ===
PROCESS ${file4}

OUTFILE ${meta_out}  .tbl
ANALYZE HETEROGENEITYs
QUIT" > ${meta_out}_metal_script.sh

metal ${meta_out}_metal_script.sh
plink1.9 --meta-analysis ${file1} ${file2} ${file3} ${file4} + qt weighted-z --out ${meta_out}
