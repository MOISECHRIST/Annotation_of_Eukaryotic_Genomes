#!/bin/bash
#SBATCH --job-name=prepare_genespace
#SBATCH --partition=pshort_el8
#SBATCH --cpus-per-task=10
#SBATCH --mem=16G
#SBATCH --time=01:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=start,end,fail
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err


set -euo pipefail


WORKDIR=/data/users/mmeka/genome_annotation
COURSEDIR=/data/courses/genome_annotation_resources/2026
Accession=Nov_02
FINALDIR="$WORKDIR/results/MAKER/final"
GENES="$FINALDIR/filtered.genes.renamed.gff3"
OUTDIR="$WORKDIR/results/comparisons"
GENESPACE_DIR="$OUTDIR/GENESPACE"
LONGEST_PROTEINS="$FINALDIR/assembly.all.maker.proteins.renamed.longest.fasta"

mkdir -p "$GENESPACE_DIR/bed" "$GENESPACE_DIR/peptide" "$GENESPACE_DIR/tmp"

grep -P "\tgene\t" "$GENES" > "$GENESPACE_DIR/temp_genes.gff3"

# Get the the first attribute in column 9 which is ID=gene_name.
awk 'BEGIN{OFS="\t"} {split($9,a,";"); split(a[1],b,"="); print $1, $4-1, $5, b[2]}' \
    "$GENESPACE_DIR/temp_genes.gff3" > "$GENESPACE_DIR/bed/${Accession}.bed"

# Remove transcript suffixes and descriptions from FASTA headers.
sed '/^>/s/ .*//' "$LONGEST_PROTEINS" | sed '/^>/s/-R[A-Z]*$//' \
    > "$GENESPACE_DIR/peptide/${Accession}.fa"

# Add TAIR10. Copy the BED and FASTA files from the course directory
cp "$COURSEDIR/data/TAIR10.bed" "$GENESPACE_DIR/bed/TAIR10.bed"
cp "$COURSEDIR/data/TAIR10.fa" "$GENESPACE_DIR/peptide/TAIR10.fa"

for other in $(echo "Are_6 Est_0 Etna_2"); do
    cp "$COURSEDIR/data/Lian_et_al/GENESPACE/bed/${other}.bed" \
    "$GENESPACE_DIR/bed/${other}.bed"
    cp "$COURSEDIR/data/Lian_et_al/GENESPACE/peptide/${other}.fa" \
    "$GENESPACE_DIR/peptide/${other}.fa"
done 