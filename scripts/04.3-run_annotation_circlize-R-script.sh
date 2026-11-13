#!/bin/bash
#SBATCH --job-name=annotation_circlize-R-script
#SBATCH --partition=pshort_el8
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=01:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=start,end,fail
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err

set -euo pipefail
COURSEDIR=/data/courses/genome_annotation_resources/2026
WORKDIR=/data/users/mmeka/genome_annotation
OUTDIR="$WORKDIR/results/LTR_full_length"
unset SINGULARITY_BIND APPTAINER_BIND SINGULARITY_TMPDIR

apptainer exec -C --bind "$WORKDIR" --bind "$COURSEDIR" --pwd "$WORKDIR" \
  "$COURSEDIR/containers/Annotation_analysis_R4.4.sif" \
  Rscript --vanilla "$WORKDIR/scripts/04.2-annotation_circlize.R" >> plots/annotation_circlize-R-script.log 1>&2