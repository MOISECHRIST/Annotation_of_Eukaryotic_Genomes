#!/bin/bash
#SBATCH --job-name=samtools_faidx
#SBATCH --partition=pshort_el8
#SBATCH --cpus-per-task=20
#SBATCH --mem=64G
#SBATCH --time=02:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=start,end,fail
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err

WORKDIR=/data/users/mmeka/genome_annotation
OUTDIR="${WORKDIR}/results/samtools_faidx"
COURSEDIR=/data/courses/genome_annotation_resources/2026

mkdir -p "$OUTDIR"
ln -s "$WORKDIR/data/assemblies/flye/assembly.fasta" "$OUTDIR/assembly.fasta"
cd "$OUTDIR"

apptainer exec -C --bind "$WORKDIR" \
    "$COURSEDIR/containers/Annotation_analysis_R4.4.sif" \
    samtools faidx \
    "$OUTDIR/assembly.fasta"