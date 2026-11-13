#!/bin/bash
#SBATCH --job-name=extract_Copia-Gypsy
#SBATCH --partition=pshort_el8
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G
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

cd "$WORKDIR/results/EDTA"
genome="${WORKDIR}/results/EDTA/assembly.fasta"

current_superfamilly=${SUPERFAMILLIES[${SLURM_ARRAY_TASK_ID}]}

apptainer exec -C --bind "$WORKDIR" \
    "$COURSEDIR/containers/Annotation_analysis_R4.4.sif" \
    seqkit grep -r -p "${current_superfamilly}" \
    $genome.mod.EDTA.TElib.fa > ${current_superfamilly}_sequences.fa