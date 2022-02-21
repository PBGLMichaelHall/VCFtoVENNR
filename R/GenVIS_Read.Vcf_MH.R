#This is a function I wrote modified from the GenomicVis package due to errors


GenVIS_Read.Vcf_MH<-function (f, genome, exclude.filtered = FALSE, read.info = FALSE,
                              read.geno = FALSE, filter.func = NULL)
{
  params <- if (read.info == FALSE & read.geno == FALSE)
    ScanVcfParam(info = NA, geno = NA)
  else if (read.info == FALSE & read.geno == TRUE)
    ScanVcfParam(info = NA)
  else if (read.info == TRUE & read.geno == FALSE)
    ScanVcfParam(geno = NA)
  else ScanVcfParam()
  vcf <- readVcf(f, genome, params)
  if (is.function(filter.func))
    vcf <- filter.func(vcf)
  if (exclude.filtered)
    vcf <- vcf[fixed(vcf)$FILTER %in% c("PASS", ".")]
  vcf <- vcf[width(ref(vcf)) == 1]
  vcf <- vcf[elementNROWS(alt(vcf)) == 1]
  vcf <- vcf[width(unlist(alt(vcf))) == 1]
  vcf
}


