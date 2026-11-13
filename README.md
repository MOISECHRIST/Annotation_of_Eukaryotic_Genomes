# Annotation of Eukaryotic Genomes
## Project structure

```
.
├── control_files/
├── data
│   └── assemblies
│       └── flye
├── plots
├── README.md
├── results
│   ├── comparisons/
│   ├── EDTA/
│   ├── LTR_full_length/
│   ├── MAKER/
│   ├── parseRM/
│   ├── samtools_faidx/
│   ├── TEsorter_Copia/
│   └── TEsorter_Gypsy/
└── scripts/
    ├── 01-run_EDTA.sh
    ├── 02-run_TEsorter_full_length_LTRs.sh
    ├── 03.1-run_full_length_LTRs-R-script.sh
    ├── 03.2-full_length_LTRs_identity_copy.R
    ├── 04.1-run_samtools_faidx.sh
    ├── 04.2-annotation_circlize.R
    ├── 04.3-run_annotation_circlize-R-script.sh
    ├── 05.1_run_extract_Copia-Gypsy.sh
    ├── 05.2_run_TEsorter_Copie-Gypsy.sh
    ├── 06.1-parseRM.pl
    ├── 06.2-parseRM.sh
    ├── 07.1-plot_div.R
    ├── 07.2-TE_landscape_div_plot.sh
    ├── 08.1-run_maker.sh
    ├── 08.2-run_merge_maker_output.sh
    ├── 08.3-rename_gene-transcript.sh
    ├── 08.4_Run_InterProScan.sh
    ├── 08.5_run_quality-filtering.sh
    ├── 09_run_BUSCO.sh
    ├── 10.1-annotation_circlize.R
    ├── 10.2-run_annotation_circlize-R-script.sh
    ├── 10-run_AGAT_Annotation-Statistics.sh
    ├── 11-run_blastp.sh
    ├── 12-add_UniProt_Function.sh
    ├── 13.0-prepare_genespace.sh
    ├── 13.1-genespace.R
    ├── 13.2-run_genespace.sh
    ├── 14.1-process_pangenome.R
    ├── 14.2-run_pangenome.sh
    ├── 15.1-visualize_synteny.R
    └── 15.2-run_visualize_synteny.sh
```
