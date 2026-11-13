#!/bin/bash
#SBATCH --job-name=TEsorter_Copia-Gypsy
#SBATCH --partition=pshort_el8
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=01:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=start,end,fail
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err
#SBATCH --array=0-1

set -euo pipefail

SUPERFAMILLIES=(Gypsy Copia)
COURSEDIR=/data/courses/genome_annotation_resources/2026
WORKDIR=/data/users/mmeka/genome_annotation

current_superfamilly=${SUPERFAMILLIES[${SLURM_ARRAY_TASK_ID}]}
OUTDIR="$WORKDIR/results/TEsorter_${current_superfamilly}"
FASTA="$WORKDIR/results/EDTA/${current_superfamilly}_sequences.fa"

mkdir -p "$OUTDIR"
unset SINGULARITY_BIND APPTAINER_BIND SINGULARITY_TMPDIR
mkdir -p "$OUTDIR/tmp"

cp "$FASTA" "$OUTDIR/${current_superfamilly}_sequences.fa"
cd "$OUTDIR"

apptainer exec --bind "$WORKDIR" --bind "$COURSEDIR" \
    --bind "$OUTDIR/tmp":/tmp --pwd "$OUTDIR" \
    "$COURSEDIR/containers/TEsorter_1.3.0.sif" \
    TEsorter "${current_superfamilly}_sequences.fa" -db rexdb-plant -p "$SLURM_CPUS_PER_TASK"