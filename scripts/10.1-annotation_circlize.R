# ============================================================
# Circos plot: gene annotation + TE annotation (EDTA)
# ============================================================

library(circlize)
library(tidyverse)
library(ComplexHeatmap)

# ------------------------------------------------------------
# 1. Parameters (adjust paths)
# ------------------------------------------------------------
te_gff_file   <- "results/EDTA/assembly.fasta.mod.EDTA.TEanno.gff3"
gene_gff_file <- "results/MAKER/final/filtered.genes.renamed.gff3"          # <- your gene annotation
fai_file      <- "results/samtools_faidx/assembly.fasta.fai"
out_pdf       <- "plots/03-TE_gene_density.pdf"

n_scaffolds   <- 20     # number of longest scaffolds to plot
window_size   <- 1e5    # window size for density (bp)
gene_feature  <- "gene" # use "mRNA" if your GFF has no "gene" lines

# TE superfamilies to plot (names as in column 3 of the EDTA GFF3) and colours
te_tracks <- c(
  "Gypsy_LTR_retrotransposon" = "darkgreen",
  "Copia_LTR_retrotransposon" = "darkred"
)

dir.create(dirname(out_pdf), showWarnings = FALSE, recursive = TRUE)

# ------------------------------------------------------------
# 2. Load data
# ------------------------------------------------------------
read_gff <- function(file) {
  read.table(file, header = FALSE, sep = "\t", stringsAsFactors = FALSE,
             quote = "", comment.char = "#", fill = TRUE)
}

te_gff   <- read_gff(te_gff_file)
gene_gff <- read_gff(gene_gff_file)

# Features present in each file
message("TE features:")
print(table(te_gff$V3))
message("Gene annotation features:")
print(table(gene_gff$V3))

# ------------------------------------------------------------
# 3. Custom ideogram from the .fai index
# ------------------------------------------------------------
custom_ideogram <- read.table(fai_file, header = FALSE, stringsAsFactors = FALSE)
custom_ideogram <- data.frame(
  chr   = custom_ideogram$V1,
  start = 1,
  end   = custom_ideogram$V2,
  stringsAsFactors = FALSE
)
custom_ideogram <- custom_ideogram[order(custom_ideogram$end, decreasing = TRUE), ]
custom_ideogram <- head(custom_ideogram, n_scaffolds)
message("Total length of selected scaffolds (bp): ", sum(custom_ideogram$end))

# ------------------------------------------------------------
# 4. Helper: extract a feature type as a bed-like data.frame
#    (set feature = NULL to keep all features)
# ------------------------------------------------------------
get_feature <- function(gff, feature = NULL, ideogram = custom_ideogram) {
  if (!is.null(feature)) gff <- gff[gff$V3 == feature, ]
  gff %>%
    as.data.frame() %>%
    mutate(chrom = V1, start = V4, end = V5, strand = V6) %>%
    select(chrom, start, end, strand) %>%
    filter(chrom %in% ideogram$chr)
}

genes <- get_feature(gene_gff, gene_feature)
all_te <- get_feature(te_gff, NULL)

# Sanity check: scaffold names must match between files
if (nrow(genes) == 0) {
  stop("No genes left after filtering. Check scaffold names and that '",
       gene_feature, "' exists in column 3 of the gene GFF3.")
}
message("Genes plotted: ", nrow(genes), " | TE features plotted: ", nrow(all_te))

# ------------------------------------------------------------
# 5. Optional: Athila and CRM clades (from TEsorter on the TE library)
#    Requires a table mapping TE IDs to clades. Skipped if the file is absent.
# ------------------------------------------------------------
# Expected: TEsorter output "<lib>.cls.tsv" with columns #TE, Order, Superfamily, Clade, ...
tesorter_file <- "results/TEsorter/assembly.fasta.mod.EDTA.TElib.fa.rexdb-plant.cls.tsv"
clade_tracks  <- list()

if (file.exists(tesorter_file)) {
  cls <- read.delim(tesorter_file, header = TRUE, check.names = FALSE,
                    stringsAsFactors = FALSE)
  colnames(cls)[1] <- "TE"
  cls$TE_id <- sub("#.*", "", cls$TE)   # strip "#LTR/Gypsy" style suffix

  # Library IDs (e.g. TE_00000123) appear in the Name= attribute of EDTA GFF3
  te_named <- te_gff %>%
    mutate(
      TE_id = str_match(V9, "Name=([^;]+)")[, 2],
      TE_id = sub("#.*", "", TE_id)
    )

  for (clade in c("Athila", "CRM")) {
    ids <- cls$TE_id[cls$Clade == clade]
    sub_gff <- te_named[te_named$TE_id %in% ids, 1:9]
    if (nrow(sub_gff) > 0) {
      clade_tracks[[clade]] <- get_feature(sub_gff, NULL)
    }
  }
}

# ------------------------------------------------------------
# 6. Plot 1: genes + selected TE superfamilies + all TEs
# ------------------------------------------------------------
pdf(out_pdf, width = 10, height = 10)

gaps <- c(rep(1, nrow(custom_ideogram) - 1), 5)
circos.par(start.degree = 90, gap.after = 1, track.margin = c(0, 0), gap.degree = gaps)
circos.genomicInitialize(custom_ideogram)

# Track 1 (outer): genes
circos.genomicDensity(genes, count_by = "number", col = "steelblue",
                      track.height = 0.07, window.size = window_size)

# Tracks 3+: individual TE superfamilies
for (sf in names(te_tracks)) {
  circos.genomicDensity(get_feature(te_gff, sf), count_by = "number",
                        col = te_tracks[[sf]], track.height = 0.07,
                        window.size = window_size)
}

circos.clear()

lgd <- Legend(
  title = "Feature",
  at = c("Genes", sub("_.*", "", names(te_tracks))),
  legend_gp = gpar(fill = c("steelblue", unname(te_tracks)))
)
draw(lgd, x = unit(8, "cm"), y = unit(10, "cm"), just = "center")

dev.off()

# ------------------------------------------------------------
# 7. Plot 2: genes vs. centromeric clades (Athila, CRM), if available
# ------------------------------------------------------------
if (length(clade_tracks) > 0) {
  clade_cols <- c(Athila = "orange", CRM = "purple")
  out_pdf2 <- sub("\\.pdf$", "_centromeric_clades.pdf", out_pdf)

  pdf(out_pdf2, width = 10, height = 10)
  circos.par(start.degree = 90, gap.after = 1, track.margin = c(0, 0), gap.degree = gaps)
  circos.genomicInitialize(custom_ideogram)

  circos.genomicDensity(genes, count_by = "number", col = "steelblue",
                        track.height = 0.07, window.size = window_size)

  for (clade in names(clade_tracks)) {
    circos.genomicDensity(clade_tracks[[clade]], count_by = "number",
                          col = clade_cols[[clade]], track.height = 0.07,
                          window.size = window_size)
  }
  circos.clear()

  lgd2 <- Legend(
    title = "Feature",
    at = c("Genes", names(clade_tracks)),
    legend_gp = gpar(fill = c("steelblue", unname(clade_cols[names(clade_tracks)])))
  )
  draw(lgd2, x = unit(8, "cm"), y = unit(10, "cm"), just = "center")
  dev.off()
} else {
  message("No TEsorter clade table found: skipping Athila/CRM plot.")
}

message("Done: ", out_pdf)