#!/bin/bash
#SBATCH --job-name=parseRM
#SBATCH --partition=pshort_el8
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G
#SBATCH --time=01:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=fail,end
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err


set -euo pipefail
WORKDIR=/data/users/mmeka/genome_annotation
COURSEDIR="/data/courses/genome_annotation_resources/2026"
INDIR="$WORKDIR/results/EDTA/assembly.fasta.mod.EDTA.anno"
OUTDIR="$WORKDIR/results/parseRM"
PARSERM_SCRIPT="${WORKDIR}/scripts/06.1-parseRM.pl"

mkdir -p $OUTDIR
cd "$OUTDIR"

# Step 1: remove hits with 0% divergence
awk 'NR == 1 || $2 != 0' "$INDIR/assembly.fasta.mod.EDTA.RM.out" > "$OUTDIR/assembly.fasta.mod.EDTA.RM.nonzero.out"


# Step 2: bin divergence into 1% bins (up to 50%) per TE superfamily
apptainer exec -C --bind "$WORKDIR" --bind "$COURSEDIR" \
    "$COURSEDIR/containers/Annotation_analysis_R4.4.sif" \
    perl "$PARSERM_SCRIPT" \
    -i "$OUTDIR/assembly.fasta.mod.EDTA.RM.nonzero.out" \
    -l 50,1 -v

