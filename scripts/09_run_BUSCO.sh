#!/bin/bash
#SBATCH --job-name=BUSCO
#SBATCH --partition=pibu_el8
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=03:00:00
#SBATCH --mail-user=moise.meka@students.unibe.ch
#SBATCH --mail-type=start,end,fail
#SBATCH --output=.logs/%x_%j.out
#SBATCH --error=.logs/%x_%j.err
#SBATCH --account=class-sbl-30004-ws-2026
#SBATCH --reservation=class-sbl-30004-2026-10-30

set -euo pipefail

WORKDIR=/data/users/mmeka/genome_annotation
COURSEDIR=/data/courses/genome_annotation_resources/2026
OUTDIR="$WORKDIR/results/MAKER"
FINALDIR="$OUTDIR/final"

protein="assembly.all.maker.proteins"
transcript="assembly.all.maker.transcripts"
gff="assembly.all.maker.noseq"

cd "$FINALDIR"

module load BUSCO/5.4.2-foss-2021a
module load SeqKit/2.6.1

export PYTHONNOUSERSITE=1

longest_per_gene () {
    in="$1"; out="$2"

    # 1. ID <tab> length for every record (ID = first word of the header)
    seqkit fx2tab -n -l -i "$in" \
      | awk -F'\t' '{g=$1; sub(/-R[A-Za-z0-9]+$/,"",g); print g"\t"$1"\t"$2}' \
      | sort -k1,1 -k3,3nr \
      | awk -F'\t' '!seen[$1]++ {print $2}' \
      > "${out}.ids"          # one ID per gene (ties: first one kept)

    # 2. Extract those records, preserving the original sequences
    seqkit grep -f "${out}.ids" "$in" > "$out"
}

longest_per_gene  ${protein}.renamed.filtered.fasta   $FINALDIR/${protein}.renamed.longest.fasta
longest_per_gene  ${transcript}.renamed.filtered.fasta  $FINALDIR/${transcript}.renamed.longest.fasta

# number of records should equal number of unique genes
grep -c '>' $FINALDIR/${protein}.renamed.longest.fasta
seqkit seq -n -i $FINALDIR/${protein}.renamed.longest.fasta | sed -E 's/-R[A-Za-z0-9]+$//' | sort -u | wc -l

# no duplicated genes
seqkit seq -n -i $FINALDIR/${protein}.renamed.longest.fasta | sed -E 's/-R[A-Za-z0-9]+$//' | sort | uniq -d

# Run BUSCO on the LONGEST protein and transcript sequences
busco -i "${protein}.renamed.longest.fasta" -l brassicales_odb10 -o "busco_proteins" -m proteins -c 4
busco -i "${transcript}.renamed.longest.fasta" -l brassicales_odb10 -o "busco_transcripts" -m transcriptome -c 4