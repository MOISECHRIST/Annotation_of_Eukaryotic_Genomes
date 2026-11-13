#!/bin/bash
#SBATCH --job-name=add_UniProt-Functions
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=20
#SBATCH --mem=16G
#SBATCH --time=03:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=start,end,fail
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err


set -euo pipefail


WORKDIR=/data/users/mmeka/genome_annotation
COURSEDIR=/data/courses/genome_annotation_resources/2026
FINALDIR="$WORKDIR/results/MAKER/final"
PROTEINS="$FINALDIR/assembly.all.maker.proteins.renamed.filtered.fasta"
UNIPROT="$COURSEDIR/data/uniprot_viridiplantae_reviewed.fa"
OUTDIR="$WORKDIR/results/comparisons"
MAKER_SIF="$COURSEDIR/containers/MAKER_3.01.03.sif"
GENES="$FINALDIR/filtered.genes.renamed.gff3"


apptainer exec --cleanenv --env TMPDIR=/tmp \
    --bind /data --bind "$WORKDIR" --bind "$OUTDIR/tmp":/tmp \
    --pwd "$OUTDIR" "$MAKER_SIF" \
    maker_functional_fasta "$UNIPROT" "$OUTDIR/blastp_uniprot.besthits.tsv" "$PROTEINS" \
    > "$OUTDIR/maker_proteins.filtered.Uniprot.fasta"


apptainer exec --cleanenv --env TMPDIR=/tmp \
    --bind /data --bind "$WORKDIR" --bind "$OUTDIR/tmp":/tmp \
    --pwd "$OUTDIR" "$MAKER_SIF" \
    maker_functional_gff "$UNIPROT" "$OUTDIR/blastp_uniprot.besthits.tsv" "$GENES" \
    > "$OUTDIR/filtered.genes.Uniprot.gff3"