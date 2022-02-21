\name{GenVIS_vcf.venn_MH}
\alias{GenVIS_vcf.venn_MH}
\title{Convert VCF to Vennerable object}
\usage{
GenVIS_vcf.ven_MH(vcf.files,genome,sample.names)
}
\arguments{
\item{vcf.files}{A large collapsed vcf file read in by GenVIS_Read.Vcf_MH}
\item{genome}{A reference genome preferably fasta etc.}
\item{sample.names}{A vector of sample names}
}
\description{
Converts a large collapsed VCF file into a Vennerable Object that can be further parsed to plot venn diagrams of common SNP between samples
}
\examples{
vcf <- GenVIS_Read.Vcf_MH(f1,read.info = TRUE,read.geno = TRUE, exclude.filtered = FALSE,filter.func = FALSE)
sample.names <- c('S2','S4')
f1 <- 'freebayes~bwa~IRGSP-1.0~S2~HOM-VAR.vcf.gz'
f2 <- 'freebayes~bwa~IRGSP-1.0~S4~HOM-VAR.vcf.gz'
vcf.files <- c(f1,f2)
vennobj <- GenVIS_vcf.venn_MH(vcf.files = vcf.files, "GCF_001433935.1_IRGSP-1.0_genomic.fna",sample.names)
}
