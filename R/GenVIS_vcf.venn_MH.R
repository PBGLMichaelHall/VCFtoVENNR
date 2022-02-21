# This is a function that I modified for the purposes of venn diagram visualizations and due to errors from GenomicVis package

GenVIS_vcf.venn_MH <- function (vcf.files, genome, sample.names = NULL, ...)
{
  if (length(vcf.files) > 9)
    stop("do.venn: too many VCF files (maximum is 9)")
  if (is.null(sample.names)) {
    sample.names <- basename(vcf.files)
  }
  else {
    if (length(vcf.files) != length(sample.names))
      stop("do.venn: length(sample.name) must equal length(vcf.files)")
  }
  x <- lapply(vcf.files, function(f) rownames((rowData(readVcf(TabixFile(f), genome, ...)))))
  names(x) <- sample.names
  list(venn = Vennerable::Venn(x), data = x)
}


