#!/bin/bash
#SBATCH --job-name=TE_landscape_plot_div
#SBATCH --partition=pshort_el8
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=00:30:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=fail,end
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err

set -euo pipefail
WORKDIR=/data/users/mmeka/genome_annotation
COURSEDIR=/data/courses/genome_annotation_resources/2026

apptainer exec -C --bind "$WORKDIR" --bind "$COURSEDIR" --pwd "$WORKDIR" \
  "$COURSEDIR/containers/Annotation_analysis_R4.4.sif" \
  Rscript --vanilla "$WORKDIR/scripts/07.1-plot_div.R"