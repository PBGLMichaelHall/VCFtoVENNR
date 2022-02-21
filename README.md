
[VCFtoVENN.txt](https://github.com/PBGLMichaelHall/VCFtoVENNR/files/8108782/VCFtoVENN.txt)




library(GenomicVis)
library(VariantAnnotation)
library(stringi)
library(chromoMap)
setwd("/home/michael/Desktop/GenomicVis")
getwd()


#Call in your VCF File
f1 <- 'freebayes~bwa~IRGSP-1.0~S14~HOM-VAR.vcf.gz'

# Your reference Genome
genome <- 'GCF_001433935.1_IRGSP-1.0_genomic.fna'



vcf <- GenVIS_Read.Vcf_MH(f1,read.info = TRUE,read.geno = TRUE, exclude.filtered = FALSE,filter.func = FALSE)


sample.names <- c('S2','S4')

f1 <- 'freebayes~bwa~IRGSP-1.0~S2~HOM-VAR.vcf.gz'
f2 <- 'freebayes~bwa~IRGSP-1.0~S4~HOM-VAR.vcf.gz'
vcf.files <- c(f1,f2)

vennobj <- GenVIS_vcf.venn_MH(vcf.files = vcf.files, "GCF_001433935.1_IRGSP-1.0_genomic.fna",sample.names)

CleanList <- function(vennobj,samplename){
  v1 <- gsub("[^0-9.-]","",vennobj$data$samplename)
  v1
}

CleanList(vennobj = vennobj, samplename = S2)

#Call the vcf.venn function and provide appropriate arguments
v1<-GenVIS_vcf.venn_MH(vcf.files = vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)

#Remove anything that is not numerical
v1 <- gsub("[^0-9.-]","",v1$data$S2)

#Repeat both steps for the second VCF File
v2<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v2 <- gsub("[^0-9.-]","",v2$data$S4)

#Create an list object labeling them appropriately by Sample name variables
z99 <- list("Sample2" = v1, "Sample4" = v2)

#Confirm the data structure is in the right form
str(z99)

#Create a formal class Venn Object
w1<-Venn(Sets=z99)

#Now plot it
plot(w1)


#Choose four samples preferably from the same species in this case it is Rice
sample.names <- c('S1','S3','S4','S13')

#Again call both VCF files
f1 <- 'freebayes~bwa~IRGSP-1.0~S1~HOM-VAR.vcf.gz'
f2 <- "freebayes~bwa~IRGSP-1.0~S3~HOM-VAR.vcf.gz"
f3 <- "freebayes~bwa~IRGSP-1.0~S4~HOM-VAR.vcf.gz"
f4 <- "freebayes~bwa~IRGSP-1.0~S13~HOM-VAR.vcf.gz"

#Save the VCF files into a data vector
vcf.files <- c(f1,f2,f3,f4)

#Call the vcf.venn function and provide appropriate arguments
v1<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)

#Remove anything that is not numerical
v1 <- gsub("[^0-9.-]","",v1$data$S1)

#Repeat both steps for the second VCF File
v2<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v2 <- gsub("[^0-9.-]","",v2$data$S3)

#Repeat both steps for the third VCF File
v3<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v3 <- gsub("[^0-9.-]","",v3$data$S4)

#Repeat both steps for fourth VCF file
v4<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v4 <- gsub("[^0-9.-]","",v4$data$S13)

#Create an list object labeling them appropriately by Sample name variables
z99 <- list("Sample1" = v1, "Sample3" = v2, "Sample4" = v3, "Sample13" = v4)

#Confirm the data structure is in the right form
str(z99)

#Create a formal class Venn Object
w1<-Venn(Sets=z99,Weight = FALSE)

#Now plot it
plot(w1)



#Group the smaller cluster with samples
f10 <-"freebayes~bwa~IRGSP-1.0~S1~HOM-VAR.vcf.gz"
f11 <-"freebayes~bwa~IRGSP-1.0~S2~HOM-VAR.vcf.gz"
f12 <-"freebayes~bwa~IRGSP-1.0~S3~HOM-VAR.vcf.gz"
f13 <-"freebayes~bwa~IRGSP-1.0~S4~HOM-VAR.vcf.gz"
f14 <-"freebayes~bwa~IRGSP-1.0~S13~HOM-VAR.vcf.gz"

#Create a vcf file vector with each sample
vcf.files <- c(f10,f11,f12,f13,f14)
#Provide appropriate sample names
sample.names <- c('S1','S2','S3','S4','S13')


#Get rid of noise
v6<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v6 <- gsub("[^0-9.-]","",v6$data$S1)
v7<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v7 <- gsub("[^0-9.-]","",v7$data$S2)
v8<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v8 <- gsub("[^0-9.-]","",v8$data$S3)
v9<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v9 <- gsub("[^0-9.-]","",v9$data$S4)
v10<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v10<- gsub("[^0-9.-]","",v10$data$S13)

z99 <- list("Sample1" = v6, "Sample2" = v7, "Sample3" = v8, "Sample4" = v9, "Sample13" = v10)
str(z99)
w1<-Venn(Sets=z99,Weight = FALSE)
plot(Venn(Sets=z99,Weight = F))


All_Int <- Reduce(intersect, list(v6,v7,v8,v9,v10))


Pos<-lapply(All_Int, function(f) substr(f, 9:14, 21))


Chr<-lapply(All_Int, function(f) substr(f,6:8,8))


Chr<-lapply(Chr, function(f) gsub("6.1", "Chr1", f))
Chr<-lapply(Chr, function(f) gsub("7.1", "Chr2", f))
Chr<-lapply(Chr, function(f) gsub("8.1", "Chr3", f))
Chr<-lapply(Chr, function(f) gsub("9.1", "Chr4", f))
Chr<-lapply(Chr, function(f) gsub("0.1", "Chr5", f))
Chr<-lapply(Chr, function(f) gsub("1.1", "Chr6", f))
Chr<-lapply(Chr, function(f) gsub("2.1", "Chr7", f))
Chr<-lapply(Chr, function(f) gsub("3.1", "Chr8", f))
Chr<-lapply(Chr, function(f) gsub("4.1", "Chr9", f))
Chr<-lapply(Chr, function(f) gsub("5.1", "Chr10", f))
Chr<-lapply(Chr, function(f) gsub("6.1", "Chr11", f))
Chr<-lapply(Chr, function(f) gsub("7.1", "Chr12", f))

#Generate random alphanumeric code for each SNP
unique_id<-stri_rand_strings(n = 134, length = 4, pattern = "[A-Za-z0-9]")

DF7 <- as.data.frame(cbind(unique_id,Chr,Pos,Pos))



df_unlist<-function(df){

  df<-as.data.frame(df)

  nr<-nrow(df)

  c.names<-colnames(df)

  lscols<-as.vector(which(apply(df,2,is.list)==TRUE))

  if(length(lscols)!=0){

    for(i in lscols){

      temp<-as.vector(unlist(df[,i]))

      if(length(temp)!=nr){

        adj<-nr-length(temp)

        temp<-c(rep(0,adj),temp)

      }

      df[,i]<-temp

    } #end for

    df<-as.data.frame(df)

    colnames(df)<-c.names
  }
  return(df)
}


#Prepare an annotations file
DF7<-df_unlist(DF7)
write.table(DF7, file = "SNP.txt", sep = "\t", row.names = FALSE, col.names = FALSE)

Chr1Len <- 43270923
Chr2Len <- 35937250
Chr3Len <- 36413819
Chr4Len <- 35502694
Chr5Len <- 29958434
Chr6Len <- 31248787
Chr7Len <- 29697621
Chr8Len <- 28443022
Chr9Len <- 23012720
Chr10Len <- 23207287
Chr11Len <- 29021106
Chr12Len <- 27531856

ChrStartPos <- c(1,1,1,1,1,1,1,1,1,1,1,1)
ChrEndPos <- c(Chr1Len, Chr2Len, Chr3Len, Chr4Len, Chr5Len, Chr6Len, Chr7Len, Chr8Len, Chr9Len, Chr10Len, Chr11Len, Chr12Len)
length(ChrStartPos)
length(ChrEndPos)
Chr <- c("Chr1", "Chr2", "Chr3","Chr4","Chr5","Chr6","Chr7","Chr8","Chr9","Chr10","Chr11","Chr12")
DF8 <- as.data.frame(cbind(Chr,ChrStartPos,ChrEndPos))
DF8 <- df_unlist(DF8)
write.table(DF8, file = "chr.txt", sep = "\t", row.names = FALSE, col.names = FALSE)


chromoMap("chr.txt", "SNP.txt", ploidy = 1,title = c("Rice Samples 1,2,3,4 and 13 Common SNPs"))



getwd()





#Group the smaller cluster with samples
f10 <-"freebayes~bwa~IRGSP-1.0~S5~HOM-VAR.vcf.gz"
f11 <-"freebayes~bwa~IRGSP-1.0~S6~HOM-VAR.vcf.gz"
f12 <-"freebayes~bwa~IRGSP-1.0~S7~HOM-VAR.vcf.gz"
f13 <-"freebayes~bwa~IRGSP-1.0~S8~HOM-VAR.vcf.gz"
f14 <-"freebayes~bwa~IRGSP-1.0~S9~HOM-VAR.vcf.gz"
f15 <-"freebayes~bwa~IRGSP-1.0~S10~HOM-VAR.vcf.gz"
f16 <-"freebayes~bwa~IRGSP-1.0~S11~HOM-VAR.vcf.gz"
f17 <-"freebayes~bwa~IRGSP-1.0~S12~HOM-VAR.vcf.gz"


#Create a vcf file vector with each sample
vcf.files <- c(f10,f11,f12,f13,f14,f15,f16,f17)
#Provide appropriate sample names
sample.names <- c('S5','S6','S7','S8','S9','S10','S11','S12')


#Get rid of noise
v11<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v11 <- gsub("[^0-9.-]","",v11$data$S5)
v12<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v12 <- gsub("[^0-9.-]","",v12$data$S6)
v13<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v13 <- gsub("[^0-9.-]","",v13$data$S7)
v14<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v14 <- gsub("[^0-9.-]","",v14$data$S8)
v15<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v15<- gsub("[^0-9.-]","",v15$data$S9)
v16<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v16 <- gsub("[^0-9.-]","",v16$data$S10)
v17<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v17 <- gsub("[^0-9.-]","",v17$data$S11)
v18<-GenVIS_vcf.venn_MH(vcf.files, 'GCF_001433935.1_IRGSP-1.0_genomic.fna',sample.names)
v18<- gsub("[^0-9.-]","",v18$data$S12)





All_Int <- Reduce(intersect, list(v11,v12,v13,v14,v15,v16,v17,v18))


Pos<-lapply(All_Int, function(f) substr(f, 9:14, 21))


Chr<-lapply(All_Int, function(f) substr(f,6:8,8))


Chr<-lapply(Chr, function(f) gsub("6.1", "Chr1", f))
Chr<-lapply(Chr, function(f) gsub("7.1", "Chr2", f))
Chr<-lapply(Chr, function(f) gsub("8.1", "Chr3", f))
Chr<-lapply(Chr, function(f) gsub("9.1", "Chr4", f))
Chr<-lapply(Chr, function(f) gsub("0.1", "Chr5", f))
Chr<-lapply(Chr, function(f) gsub("1.1", "Chr6", f))
Chr<-lapply(Chr, function(f) gsub("2.1", "Chr7", f))
Chr<-lapply(Chr, function(f) gsub("3.1", "Chr8", f))
Chr<-lapply(Chr, function(f) gsub("4.1", "Chr9", f))
Chr<-lapply(Chr, function(f) gsub("5.1", "Chr10", f))
Chr<-lapply(Chr, function(f) gsub("6.1", "Chr11", f))
Chr<-lapply(Chr, function(f) gsub("7.1", "Chr12", f))
Chr

#Generate random alphanumeric code for each SNP
unique_id<-stri_rand_strings(n = 45, length = 4, pattern = "[A-Za-z0-9]")

DF7 <- as.data.frame(cbind(unique_id,Chr,Pos,Pos))



df_unlist<-function(df){

  df<-as.data.frame(df)

  nr<-nrow(df)

  c.names<-colnames(df)

  lscols<-as.vector(which(apply(df,2,is.list)==TRUE))

  if(length(lscols)!=0){

    for(i in lscols){

      temp<-as.vector(unlist(df[,i]))

      if(length(temp)!=nr){

        adj<-nr-length(temp)

        temp<-c(rep(0,adj),temp)

      }

      df[,i]<-temp

    } #end for

    df<-as.data.frame(df)

    colnames(df)<-c.names
  }
  return(df)
}


#Prepare an annotations file
DF7<-df_unlist(DF7)
write.table(DF7, file = "SNP2.txt", sep = "\t", row.names = FALSE, col.names = FALSE)

Chr1Len <- 43270923
Chr2Len <- 35937250
Chr3Len <- 36413819
Chr4Len <- 35502694
Chr5Len <- 29958434
Chr6Len <- 31248787
Chr7Len <- 29697621
Chr8Len <- 28443022
Chr9Len <- 23012720
Chr10Len <- 23207287
Chr11Len <- 29021106
Chr12Len <- 27531856

ChrStartPos <- c(1,1,1,1,1,1,1,1,1,1,1,1)
ChrEndPos <- c(Chr1Len, Chr2Len, Chr3Len, Chr4Len, Chr5Len, Chr6Len, Chr7Len, Chr8Len, Chr9Len, Chr10Len, Chr11Len, Chr12Len)
length(ChrStartPos)
length(ChrEndPos)
Chr <- c("Chr1", "Chr2", "Chr3","Chr4","Chr5","Chr6","Chr7","Chr8","Chr9","Chr10","Chr11","Chr12")
DF8 <- as.data.frame(cbind(Chr,ChrStartPos,ChrEndPos))
DF8 <- df_unlist(DF8)
write.table(DF8, file = "chr2.txt", sep = "\t", row.names = FALSE, col.names = FALSE)




chromoMap("chr.txt", "SNP.txt", ploidy = 1,title = c("Rice Samples 1,2,3,4 and 13 Common SNPs"))

chromoMap("chr2.txt", "SNP2.txt", ploidy = 1,title=c("Rice Samples 5,6,7,8,9,10,11,12 Common SNPs"))
getwd()


chromoMap("chr2.txt", "SNP2.txt",segment_annotation = T)

par(mfrow=c(1,1))

chromoMap("chr2.txt", "SNP2.txt",labels = T, label_font = 12, label_angle = -65)

chromoMap("chr.txt", "SNP.txt",labels = T, label_font = 12, label_angle = -65,canvas_height = 1000,title = c("Common SNPs rice sample 1,2,3,4,13"))

chromoMap("chr2.txt", "SNP2.txt",labels = T, label_font = 12, label_angle = -65,canvas_height = 1000,title=c("Common SNPs rice samples 5,6,7,8,9,10,11,12"))

