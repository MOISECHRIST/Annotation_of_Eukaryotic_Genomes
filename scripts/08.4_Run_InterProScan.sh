#!/bin/bash
#SBATCH --job-name=InterProScan
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=03:00:00
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

protein="assembly.all.maker.proteins"
transcript="assembly.all.maker.transcripts"
gff="assembly.all.maker.noseq"

cd "$FINALDIR"
mkdir -p "$FINALDIR/tmp"

INTERPROSCAN_SIF="$COURSEDIR/containers/InterProScan_5.70.sif"

apptainer exec --cleanenv --pwd "$FINALDIR" \
    --bind $COURSEDIR/data/interproscan-5.70-102.0/data:/opt/interproscan/data \
    --bind "$COURSEDIR" --bind "$WORKDIR" \
    --bind "$FINALDIR/tmp":/temp \
    "$INTERPROSCAN_SIF" \
    /opt/interproscan/interproscan.sh \
    -appl pfam --disable-precalc -f TSV \
    --goterms --iprlookup --seqtype p \
    -i ${protein}.renamed.fasta -o output.iprscan

apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp --bind "$COURSEDIR" \
    --bind "$WORKDIR" --pwd "$FINALDIR" "$MAKER_SIF" \
    ipr_update_gff ${gff}.renamed.gff output.iprscan > ${gff}.renamed.iprscan.gff

apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp \
    --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$FINALDIR" "$MAKER_SIF" \
    perl /usr/local/bin/AED_cdf_generator.pl -b 0.025 ${gff}.renamed.gff > assembly.all.maker.renamed.AED.txt