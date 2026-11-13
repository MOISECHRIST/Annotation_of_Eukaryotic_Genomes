#!/bin/bash
#SBATCH --job-name=Rename_Gene-Transcripts
#SBATCH --partition=pshort_el8
#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=02:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=start,end,fail
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err

set -euo pipefail

WORKDIR=/data/users/mmeka/genome_annotation
COURSEDIR=/data/courses/genome_annotation_resources/2026
MAKER_SIF="$COURSEDIR/containers/MAKER_3.01.03.sif"
OUTDIR="$WORKDIR/results/MAKER"
FINALDIR="$OUTDIR/final"
# Replace with your accession prefix/short name.
prefix=Nov-02

protein="assembly.all.maker.proteins"
transcript="assembly.all.maker.transcripts"
gff="assembly.all.maker.noseq"

mkdir -p "$FINALDIR"

cp "$OUTDIR/${gff}.gff" "$FINALDIR/${gff}.renamed.gff"
cp "$OUTDIR/${protein}.fasta" "$FINALDIR/${protein}.renamed.fasta"
cp "$OUTDIR/${transcript}.fasta" "$FINALDIR/${transcript}.renamed.fasta"

cd "$FINALDIR"

apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp \
    --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$FINALDIR" \
    "$MAKER_SIF" maker_map_ids --prefix $prefix --justify 7 ${gff}.renamed.gff > id.map

apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp \
    --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$FINALDIR" \
    "$MAKER_SIF" map_gff_ids id.map ${gff}.renamed.gff

apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp \
    --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$FINALDIR" \
    "$MAKER_SIF" map_fasta_ids id.map ${protein}.renamed.fasta

apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp \
    --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$FINALDIR" \
    "$MAKER_SIF" map_fasta_ids id.map ${transcript}.renamed.fasta