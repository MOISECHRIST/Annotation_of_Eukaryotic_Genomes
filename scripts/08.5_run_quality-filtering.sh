#!/bin/bash
#SBATCH --job-name=Quality_Filtering
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=02:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=start,end,fail
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err
#SBATCH --account=class-sbl-30004-ws-2026
#SBATCH --reservation=class-sbl-30004-2026-10-30

set -euo pipefail

WORKDIR=/data/users/mmeka/genome_annotation
COURSEDIR=/data/courses/genome_annotation_resources/2026
MAKER_SIF="$COURSEDIR/containers/MAKER_3.01.03.sif"
OUTDIR="$WORKDIR/results/MAKER"
FINALDIR="$OUTDIR/final"
ANALYSIS_SIF="$COURSEDIR/containers/Annotation_analysis_R4.4.sif"

protein="assembly.all.maker.proteins"
transcript="assembly.all.maker.transcripts"
gff="assembly.all.maker.noseq"

cd "$FINALDIR"

# Filter the GFF File for Quality
apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp \
    --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$FINALDIR" "$MAKER_SIF" \
    perl /usr/local/bin/quality_filter.pl -s ${gff}.renamed.iprscan.gff > ${gff}_iprscan_quality_filtered.gff

# Filter the GFF File for Gene Features
# We only want to keep gene features and subfeatures in the third column of the gff file
grep -P "\tgene\t|\tCDS\t|\texon\t|\tfive_prime_UTR\t|\tthree_prime_UTR\t|\tmRNA\t" \
    ${gff}_iprscan_quality_filtered.gff > filtered.genes.renamed.gff3

sed -i '1i##gff-version 3' filtered.genes.renamed.gff3

# Check
cut -f3 filtered.genes.renamed.gff3 | sort | uniq

# Extract the remaining mRNA Sequences after filtering
grep -P "\tmRNA\t" filtered.genes.renamed.gff3 | awk '{print $9}' | cut -d ';' -f1 | sed 's/ID=//g' > list.txt

apptainer exec --cleanenv --bind "$COURSEDIR" --bind "$WORKDIR" \
    --pwd "$FINALDIR" "$ANALYSIS_SIF" seqkit grep -f list.txt \
    ${transcript}.renamed.fasta -o ${transcript}.renamed.filtered.fasta

apptainer exec --cleanenv --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$FINALDIR" \
    "$ANALYSIS_SIF" seqkit grep -f list.txt ${protein}.renamed.fasta -o ${protein}.renamed.filtered.fasta