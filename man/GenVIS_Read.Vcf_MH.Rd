\name{GenVIS_Read.Vcf_MH}
\alias{GenVIS_Read.Vcf_MH}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Read VCF file
}
\description{
This function reads a VCF file
}
\usage{
GenVIS_Read.Vcf_MH(f, genome, exclude.filtered = FALSE, read.info = FALSE,read.geno = FALSE, filter.func = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{f}{A vcf file}
  \item{genome}{A reference genome preferably fasta etc.}
  \item{exclude.filtered}{Boolean argument set to either TRUE or FALSE}
  \item{read.info}{Boolean argument read info fields or NOT}
  \item{read.geno}{Boolean argument read genotype field or NOT}
  \itme{filter.func}{Can make a function to filter vcf before you read it in}
%%     ~~Describe \code{x} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

f1 <- 'freebayes~bwa~IRGSP-1.0~S14~HOM-VAR.vcf.gz'

genome <- 'GCF_001433935.1_IRGSP-1.0_genomic.fna'

vcf <- GenVIS_Read.Vcf_MH(f1,read.info = TRUE,read.geno = TRUE, exclude.filtered = FALSE,filter.func = FALSE)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
