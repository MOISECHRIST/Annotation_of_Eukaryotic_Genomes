#!/bin/bash
#SBATCH --job-name=Annotation_Statistics
#SBATCH --partition=pshort_el8
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=02:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=start,end,fail
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err

set -euo pipefail

WORKDIR=/data/users/mmeka/genome_annotation
COURSEDIR=/data/courses/genome_annotation_resources/2026
OUTDIR="$WORKDIR/results/MAKER"
FINALDIR="$OUTDIR/final"


AGAT_SIF="$COURSEDIR/containers/AGAT_v1.4.1.sif"
apptainer exec --cleanenv --bind "$COURSEDIR" --bind "$WORKDIR" --pwd "$FINALDIR" "$AGAT_SIF" \
    agat_sp_statistics.pl --gff filtered.genes.renamed.gff3 --output annotation.stat