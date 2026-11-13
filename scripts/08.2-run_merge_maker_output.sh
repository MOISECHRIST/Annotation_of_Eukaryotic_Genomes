#!/bin/bash
#SBATCH --job-name=Maker_merge_outputs
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

mkdir -p "$OUTDIR/tmp"
cd "$OUTDIR"

shopt -s nullglob

INDEXES=(*.maker.output/*_master_datastore_index.log)
test "${#INDEXES[@]}" -eq 1
INDEX="${INDEXES[0]}"

#Merge GFF file with sequence information.
apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp \
    --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$OUTDIR" "$MAKER_SIF" \
    gff3_merge -d "$INDEX" -o assembly.all.maker.gff

#Merge GFF file without sequence information.
apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp \
    --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$OUTDIR" "$MAKER_SIF" \
    gff3_merge -n -d "$INDEX" -o assembly.all.maker.noseq.gff

#Merge protein and transcripts sequences 
apptainer exec --cleanenv --env TMPDIR=/tmp --bind "$OUTDIR/tmp":/tmp \
    --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$OUTDIR" "$MAKER_SIF" \
    fasta_merge -d "$INDEX" -o assembly