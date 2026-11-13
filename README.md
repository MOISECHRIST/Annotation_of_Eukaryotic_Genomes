# Annotation of Eukaryotic Genomes
## Project structure

```
.
├── control_files
│   ├── maker_bopts.ctl
│   ├── maker_evm.ctl
│   ├── maker_exe.ctl
│   └── maker_opts.ctl
├── data
│   └── assemblies
│       └── flye
│           ├── 00-assembly
│           ├── 10-consensus
│           ├── 20-repeat
│           ├── 30-contigger
│           ├── 40-polishing
│           ├── assembly.fasta
│           ├── assembly_graph.gfa
│           ├── assembly_graph.gv
│           ├── assembly_info.txt
│           ├── flye.log
│           └── params.json
├── plots
│   ├── 01_LTR_Copia_Gypsy_cladelevel.pdf
│   ├── 01_LTR_Copia_Gypsy_cladelevel.png
│   ├── 02_LTR_Copia_Gypsy_global.pdf
│   ├── 02_LTR_Copia_Gypsy_global.png
│   ├── 03-TE_density.pdf
│   ├── 03-TE_gene_density.pdf
│   ├── 2-annotation_circlize-R-script.log
│   ├── all_genomes_TAIR10.pdf
│   ├── annotation_circlize-R-script.log
│   ├── output-1.pdf
│   ├── output.pdf
│   └── TEsorter_intact_LTR_Rscript.log
├── README.md
├── results
│   ├── comparisons
│   │   ├── blastp_TAIR10.besthits.tsv
│   │   ├── blastp_TAIR10.tsv
│   │   ├── blastp_uniprot.besthits.tsv
│   │   ├── blastp_uniprot.tsv
│   │   ├── filtered.genes.Uniprot.gff3
│   │   ├── GENESPACE
│   │   │   ├── bed
│   │   │   ├── dotplots
│   │   │   ├── orthofinder
│   │   │   ├── pangenes
│   │   │   ├── pangenome_matrix.rds
│   │   │   ├── peptide
│   │   │   ├── processed_riparian
│   │   │   ├── process_pangenome
│   │   │   ├── results
│   │   │   ├── riparian
│   │   │   ├── syntenicHits
│   │   │   ├── temp_genes.gff3
│   │   │   └── tmp
│   │   ├── GENESPACE_R_tmp
│   │   ├── maker_proteins.filtered.Uniprot.fasta
│   │   └── tmp
│   ├── EDTA
│   │   ├── assembly.fasta -> /data/users/mmeka/genome_annotation/data/assemblies/flye/assembly.fasta
│   │   ├── assembly.fasta.mod
│   │   ├── assembly.fasta.mod_divergence_plot.pdf
│   │   ├── assembly.fasta.mod.EDTA.anno
│   │   │   ├── assembly.fasta.mod -> ../assembly.fasta.mod
│   │   │   ├── assembly.fasta.mod.cat.gz
│   │   │   ├── assembly.fasta.mod.div
│   │   │   ├── assembly.fasta.mod_divergence_plot.pdf
│   │   │   ├── assembly.fasta.mod.div_long
│   │   │   ├── assembly.fasta.mod.EDTA.homo.bed
│   │   │   ├── assembly.fasta.mod.EDTA.homo.gff3
│   │   │   ├── assembly.fasta.mod.EDTA.intact.bed
│   │   │   ├── assembly.fasta.mod.EDTA.intact.bed-assembly.fasta.mod.EDTA.RM.bed
│   │   │   ├── assembly.fasta.mod.EDTA.intact.bed-assembly.fasta.mod.EDTA.RM.bed.homo
│   │   │   ├── assembly.fasta.mod.EDTA.intact.bed.cmb
│   │   │   ├── assembly.fasta.mod.EDTA.intact.gff3
│   │   │   ├── assembly.fasta.mod.EDTA.RM.bed
│   │   │   ├── assembly.fasta.mod.EDTA.RM.bed-assembly.fasta.mod.EDTA.intact.bed.cmb
│   │   │   ├── assembly.fasta.mod.EDTA.RM.gff3
│   │   │   ├── assembly.fasta.mod.EDTA.RM.out
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.bed
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.bed.iter1
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.bed.iter2
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.bed.iter3
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.density_plots.pdf
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.gff3
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.gtf
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.out
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.split.bed
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.split.density
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.split.gff3
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.split.gtf
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.split.out
│   │   │   ├── assembly.fasta.mod.EDTA.TEanno.sum
│   │   │   ├── assembly.fasta.mod.EDTA.TE.fa
│   │   │   ├── assembly.fasta.mod.EDTA.TE.fa.cln
│   │   │   ├── assembly.fasta.mod.EDTA.TE.fa.stat
│   │   │   ├── assembly.fasta.mod.EDTA.TE.fa.stat.all.sum
│   │   │   ├── assembly.fasta.mod.EDTA.TE.fa.stat.nested.sum
│   │   │   ├── assembly.fasta.mod.EDTA.TE.fa.stat.redun.sum
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa.ndb
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa.nhr
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa.nin
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa.njs
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa.not
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa.nsq
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa.ntf
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa.nto
│   │   │   ├── assembly.fasta.mod.masked
│   │   │   ├── assembly.fasta.mod.new.masked
│   │   │   ├── assembly.fasta.mod.out
│   │   │   ├── assembly.fasta.mod.out.new
│   │   │   ├── assembly.fasta.mod.out.new.bed
│   │   │   ├── assembly.fasta.mod.out.new.bed.cbi
│   │   │   ├── assembly.fasta.mod.out.new.iter0
│   │   │   ├── assembly.fasta.mod.out.new.iter1
│   │   │   ├── assembly.fasta.mod.out.new.iter2
│   │   │   ├── assembly.fasta.mod.out.new.iter3
│   │   │   ├── assembly.fasta.mod.out.new.log
│   │   │   ├── assembly.fasta.mod.out.target.bed
│   │   │   ├── assembly.fasta.mod.stats
│   │   │   └── assembly.fasta.mod.tbl
│   │   ├── assembly.fasta.mod.EDTA.combine
│   │   │   ├── assembly.fasta.mod.EDTA.fa.stg1
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln
│   │   │   ├── assembly.fasta.mod.Helitron.intact.raw.fa
│   │   │   ├── assembly.fasta.mod.Helitron.intact.raw.fa.cln
│   │   │   ├── assembly.fasta.mod.Helitron.intact.raw.fa.int.cln
│   │   │   ├── assembly.fasta.mod.Helitron.intact.raw.fa.njs
│   │   │   ├── assembly.fasta.mod.LINE.raw.fa
│   │   │   ├── assembly.fasta.mod.LTR.intact.raw.fa
│   │   │   ├── assembly.fasta.mod.LTR.intact.raw.fa.cln
│   │   │   ├── assembly.fasta.mod.LTR.intact.raw.fa.njs
│   │   │   ├── assembly.fasta.mod.LTR.raw.fa
│   │   │   ├── assembly.fasta.mod.LTR.raw.fa.cln
│   │   │   ├── assembly.fasta.mod.LTR.raw.fa.njs
│   │   │   ├── assembly.fasta.mod.LTR.raw.fa.preSunOct250121502026.RMoutput
│   │   │   ├── assembly.fasta.mod.SINE.raw.fa
│   │   │   ├── assembly.fasta.mod.SINE.raw.fa.cat.all
│   │   │   ├── assembly.fasta.mod.SINE.raw.fa.cln
│   │   │   ├── assembly.fasta.mod.TIR.intact.raw.fa
│   │   │   ├── assembly.fasta.mod.TIR.intact.raw.fa.cln
│   │   │   ├── assembly.fasta.mod.TIR.intact.raw.fa.cln-assembly.fasta.mod.LTR.intact.raw.fa.RM.status
│   │   │   ├── assembly.fasta.mod.TIR.intact.raw.fa.cln.njs
│   │   │   ├── assembly.fasta.mod.TIR.intact.raw.fa.int.cln
│   │   │   └── assembly.fasta.mod.TIR.intact.raw.fa.njs
│   │   ├── assembly.fasta.mod.EDTA.final
│   │   │   ├── assembly.fasta.mod.EDTA.fa.stg1
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln2
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln2.cat
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln2.false.list
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln2.masked
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln2.out
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln2.rename
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln2.rename.list
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln2.RMall.list
│   │   │   ├── assembly.fasta.mod.EDTA.intact.fa.cln2.tbl
│   │   │   ├── assembly.fasta.mod.EDTA.intact.gff3
│   │   │   ├── assembly.fasta.mod.EDTA.intact.raw.gff3
│   │   │   ├── assembly.fasta.mod.EDTA.intact.raw.gff3.rename
│   │   │   ├── assembly.fasta.mod.EDTA.intact.raw.gff3.rename.dirtlist
│   │   │   ├── assembly.fasta.mod.EDTA.intact.raw.gff3.rename.famlist
│   │   │   ├── assembly.fasta.mod.EDTA.intact.raw.gff3.rename.removed
│   │   │   ├── assembly.fasta.mod.EDTA.raw.fa
│   │   │   ├── assembly.fasta.mod.EDTA.raw.fa.preSunOct250124592026.RMoutput
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.fa
│   │   │   ├── assembly.fasta.mod.EDTA.TElib.LTRbound
│   │   │   ├── assembly.fasta.mod.RM2.fa
│   │   │   ├── assembly.fasta.mod.RM2.fa.cat
│   │   │   ├── assembly.fasta.mod.RM2.fa.masked
│   │   │   ├── assembly.fasta.mod.RM2.fa.masked.cleanup
│   │   │   ├── assembly.fasta.mod.RM2.fa.out
│   │   │   ├── assembly.fasta.mod.RM2.fa.stg1
│   │   │   ├── assembly.fasta.mod.RM2.fa.stg1.clean
│   │   │   ├── assembly.fasta.mod.RM2.fa.stg1.exclude
│   │   │   ├── assembly.fasta.mod.RM2.fa.stg1.exclude.list
│   │   │   ├── assembly.fasta.mod.RM2.fa.stg1.prot_clean
│   │   │   ├── assembly.fasta.mod.RM2.fa.stg1.prot.out
│   │   │   ├── assembly.fasta.mod.RM2.fa.tbl
│   │   │   ├── TAIR10_cds_20110103_representative_gene_model_updated.code
│   │   │   ├── TAIR10_cds_20110103_representative_gene_model_updated.code.list
│   │   │   ├── TAIR10_cds_20110103_representative_gene_model_updated.code.noTE
│   │   │   ├── TAIR10_cds_20110103_representative_gene_model_updated.code.TE
│   │   │   └── TAIR10_cds_20110103_representative_gene_model_updated.code.TE.list
│   │   ├── assembly.fasta.mod.EDTA.intact.fa
│   │   ├── assembly.fasta.mod.EDTA.intact.gff3
│   │   ├── assembly.fasta.mod.EDTA.raw
│   │   │   ├── assembly.fasta.mod.EDTA.intact.raw.fa
│   │   │   ├── assembly.fasta.mod.EDTA.intact.raw.gff3
│   │   │   ├── assembly.fasta.mod.Helitron.intact.raw.bed
│   │   │   ├── assembly.fasta.mod.Helitron.intact.raw.fa
│   │   │   ├── assembly.fasta.mod.Helitron.intact.raw.fa.anno.list
│   │   │   ├── assembly.fasta.mod.Helitron.intact.raw.gff3
│   │   │   ├── assembly.fasta.mod.LINE.raw.fa
│   │   │   ├── assembly.fasta.mod.LTR.intact.raw.fa
│   │   │   ├── assembly.fasta.mod.LTR.intact.raw.fa.anno.list
│   │   │   ├── assembly.fasta.mod.LTR.intact.raw.gff3
│   │   │   ├── assembly.fasta.mod.LTRlib.fa.LTRbound
│   │   │   ├── assembly.fasta.mod.LTR.raw.fa
│   │   │   ├── assembly.fasta.mod.RM2.fa
│   │   │   ├── assembly.fasta.mod.SINE.raw.fa
│   │   │   ├── assembly.fasta.mod.TIR.intact.raw.bed
│   │   │   ├── assembly.fasta.mod.TIR.intact.raw.fa
│   │   │   ├── assembly.fasta.mod.TIR.intact.raw.fa.anno.list
│   │   │   ├── assembly.fasta.mod.TIR.intact.raw.gff3
│   │   │   ├── Helitron
│   │   │   ├── LINE
│   │   │   ├── LTR
│   │   │   ├── SINE
│   │   │   └── TIR
│   │   ├── assembly.fasta.mod.EDTA.TEanno.density_plots.pdf
│   │   ├── assembly.fasta.mod.EDTA.TEanno.gff3
│   │   ├── assembly.fasta.mod.EDTA.TEanno.gtf
│   │   ├── assembly.fasta.mod.EDTA.TEanno.sum
│   │   ├── assembly.fasta.mod.EDTA.TElib.fa
│   │   ├── assembly.fasta.mod.EDTA.TElib.LTRbound
│   │   ├── assembly.fasta.mod.fxi
│   │   ├── assembly.fasta.mod.RM2.raw.fa
│   │   ├── Copia_sequences.fa
│   │   ├── Gypsy_sequences.fa
│   │   ├── TAIR10_cds_20110103_representative_gene_model_updated -> /data/courses/genome_annotation_resources/2026/data/TAIR10_cds_20110103_representative_gene_model_updated
│   │   └── tmp
│   │       └── hsperfdata_mmeka
│   ├── LTR_full_length
│   │   ├── intact_LTR.fa
│   │   ├── intact_LTR.fa.rexdb-plant.cls.lib
│   │   ├── intact_LTR.fa.rexdb-plant.cls.pep
│   │   ├── intact_LTR.fa.rexdb-plant.cls.tsv
│   │   ├── intact_LTR.fa.rexdb-plant.dom.faa
│   │   ├── intact_LTR.fa.rexdb-plant.dom.gff3
│   │   ├── intact_LTR.fa.rexdb-plant.domtbl
│   │   ├── intact_LTR.fa.rexdb-plant.dom.tsv
│   │   ├── intact_LTR.gff3
│   │   └── plots
│   │       ├── 01_LTR_Copia_Gypsy_cladelevel.pdf
│   │       ├── 01_LTR_Copia_Gypsy_cladelevel.png
│   │       ├── 02_LTR_Copia_Gypsy_global.pdf
│   │       ├── 02_LTR_Copia_Gypsy_global.png
│   │       └── summary.log
│   ├── MAKER
│   │   ├── assembly.all.maker.augustus_masked.proteins.fasta
│   │   ├── assembly.all.maker.augustus_masked.transcripts.fasta
│   │   ├── assembly.all.maker.gff
│   │   ├── assembly.all.maker.non_overlapping_ab_initio.proteins.fasta
│   │   ├── assembly.all.maker.non_overlapping_ab_initio.transcripts.fasta
│   │   ├── assembly.all.maker.noseq.gff
│   │   ├── assembly.all.maker.proteins.fasta
│   │   ├── assembly.all.maker.transcripts.fasta
│   │   ├── assembly.maker.output
│   │   │   ├── assembly_datastore
│   │   │   ├── assembly_master_datastore_index.log
│   │   │   ├── maker_bopts.log
│   │   │   ├── maker_evm.log
│   │   │   ├── maker_exe.log
│   │   │   ├── maker_opts.log
│   │   │   ├── mpi_blastdb
│   │   │   ├── repeatmasker.first.done
│   │   │   ├── repeatmasker.first.start
│   │   │   └── seen.dbm
│   │   ├── final
│   │   │   ├── annotation.stat
│   │   │   ├── assembly.all.maker.noseq_iprscan_quality_filtered.gff
│   │   │   ├── assembly.all.maker.noseq.renamed.gff
│   │   │   ├── assembly.all.maker.noseq.renamed.iprscan.gff
│   │   │   ├── assembly.all.maker.proteins.renamed.fasta
│   │   │   ├── assembly.all.maker.proteins.renamed.filtered.fasta
│   │   │   ├── assembly.all.maker.proteins.renamed.longest.fasta
│   │   │   ├── assembly.all.maker.proteins.renamed.longest.fasta.ids
│   │   │   ├── assembly.all.maker.renamed.AED.txt
│   │   │   ├── assembly.all.maker.transcripts.renamed.fasta
│   │   │   ├── assembly.all.maker.transcripts.renamed.filtered.fasta
│   │   │   ├── assembly.all.maker.transcripts.renamed.longest.fasta
│   │   │   ├── assembly.all.maker.transcripts.renamed.longest.fasta.ids
│   │   │   ├── busco_downloads
│   │   │   ├── busco_proteins
│   │   │   ├── busco_transcripts
│   │   │   ├── filtered.genes.renamed.agat.log
│   │   │   ├── filtered.genes.renamed.gff3
│   │   │   ├── id.map
│   │   │   ├── list.txt
│   │   │   ├── output.iprscan
│   │   │   ├── temp
│   │   │   └── tmp
│   │   ├── maker_bopts.ctl
│   │   ├── maker_evm.ctl
│   │   ├── maker_exe.ctl
│   │   ├── maker_opts.ctl
│   │   └── tmp
│   ├── parseRM
│   │   ├── assembly.fasta.mod.EDTA.RM.nonzero.out
│   │   ├── assembly.fasta.mod.EDTA.RM.nonzero.out.landscape.Div.Rclass.tab
│   │   ├── assembly.fasta.mod.EDTA.RM.nonzero.out.landscape.Div.Rfam.tab
│   │   └── assembly.fasta.mod.EDTA.RM.nonzero.out.landscape.Div.Rname.tab
│   ├── samtools_faidx
│   │   ├── assembly.fasta -> /data/users/mmeka/genome_annotation/data/assemblies/flye/assembly.fasta
│   │   └── assembly.fasta.fai
│   ├── TEsorter_Copia
│   │   ├── Copia_sequences.fa
│   │   ├── Copia_sequences.fa.rexdb-plant.cls.lib
│   │   ├── Copia_sequences.fa.rexdb-plant.cls.pep
│   │   ├── Copia_sequences.fa.rexdb-plant.cls.tsv
│   │   ├── Copia_sequences.fa.rexdb-plant.dom.faa
│   │   ├── Copia_sequences.fa.rexdb-plant.dom.gff3
│   │   ├── Copia_sequences.fa.rexdb-plant.domtbl
│   │   └── Copia_sequences.fa.rexdb-plant.dom.tsv
│   └── TEsorter_Gypsy
│       ├── Gypsy_sequences.fa
│       ├── Gypsy_sequences.fa.rexdb-plant.cls.lib
│       ├── Gypsy_sequences.fa.rexdb-plant.cls.pep
│       ├── Gypsy_sequences.fa.rexdb-plant.cls.tsv
│       ├── Gypsy_sequences.fa.rexdb-plant.dom.faa
│       ├── Gypsy_sequences.fa.rexdb-plant.dom.gff3
│       ├── Gypsy_sequences.fa.rexdb-plant.domtbl
│       └── Gypsy_sequences.fa.rexdb-plant.dom.tsv
├── Rplots.pdf
└── scripts
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

60 directories, 288 files
```
