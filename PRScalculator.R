# Checking pacman installation
if (!require(pacman)) {
  install.packages("pacman")
  library(pacman)
}

# Loading the relevant packages
pacman::p_load(pacman,dplyr,stringr, vcfR)

### YOUR VCF FILE SPECIFY THE PATH HERE!!!
vcf <- read.vcfR("<REPLACE PATH TO YOUR VCF FILE HERE>")

# Loading the data --------------------------------------------------------
Genetic_Landscape_of_AD <- read.delim("./data/Genetic_Landscape_of_AD.tsv")
#View(Genetic_Landscape_of_AD)

Variants_Included_In_PRS <- read.delim("./data/Variants_Included_In_PRS.tsv")
#View(Variants_Included_In_PRS)

Meta_GWAS_Case.control_AD.by.proxy <- read.delim("./data/Meta_GWAS_Case-control_AD-by-proxy.tsv")
#View(Meta_GWAS_Case.control_AD.by.proxy)

Sumstats_SPIGAPUK2_20190625 <- read.delim("./data/Sumstats_SPIGAPUK2_20190625.txt")

# Getting all the variants for PRS calculation
AD_VARIANTS <- c(Variants_Included_In_PRS$RS, "rs429358", "rs7412")  # APOE4 , APOE2


# Some EDA ----------------------------------------------------------------


# Set Differences among RS values.
setdiff(Genetic_Landscape_of_AD$RS, Variants_Included_In_PRS$RS)
setdiff(Variants_Included_In_PRS$RS, Genetic_Landscape_of_AD$RS)

setdiff(Genetic_Landscape_of_AD$RS, Meta_GWAS_Case.control_AD.by.proxy$Variant)
setdiff(Meta_GWAS_Case.control_AD.by.proxy$Variant, Genetic_Landscape_of_AD$RS)

setdiff(Meta_GWAS_Case.control_AD.by.proxy$Variant, Variants_Included_In_PRS$RS) # Strange
setdiff(Variants_Included_In_PRS$RS, Meta_GWAS_Case.control_AD.by.proxy$Variant) # This is strange

# Set Differences among Genes.
setdiff(Meta_GWAS_Case.control_AD.by.proxy$Nearest_Gene, Variants_Included_In_PRS$Gene)
setdiff(Variants_Included_In_PRS$Gene, Meta_GWAS_Case.control_AD.by.proxy$Nearest_Gene)

setdiff(Genetic_Landscape_of_AD$Closet.Gene, Meta_GWAS_Case.control_AD.by.proxy$Nearest_Gene)
setdiff(Meta_GWAS_Case.control_AD.by.proxy$Nearest_Gene, Genetic_Landscape_of_AD$Closet.Gene)

# Transfroming the Meta_Gwas DF 
Meta_GWAS_Case.control_AD.by.proxy <- mutate(Meta_GWAS_Case.control_AD.by.proxy, OR=substring(OR.95.CI.,1,4))
Meta_GWAS_Case.control_AD.by.proxy <- mutate(Meta_GWAS_Case.control_AD.by.proxy, OR=as.numeric(str_replace(OR,',','.')))
Meta_GWAS_Case.control_AD.by.proxy <- mutate(Meta_GWAS_Case.control_AD.by.proxy, betas=log(OR))



# AD Variants present in patient ------------------------------------------

total_hits <- 0
AD_VARIANTS_IN_PATIENT <- c()
AD_VARIANT_GENOTYPE <- c()

for (rs in AD_VARIANTS) {
  
  index = which(rs==vcf@fix[,3])
  
  if (length(index)>0) {
    AD_VARIANTS_IN_PATIENT <- c(AD_VARIANTS_IN_PATIENT, rs)
    AD_VARIANT_GENOTYPE <- c(AD_VARIANT_GENOTYPE, as.character(substring(vcf@gt[index,2],1,3)) )
    total_hits <- total_hits + 1
  }

}

print(total_hits)
print(AD_VARIANTS_IN_PATIENT)
print(AD_VARIANT_GENOTYPE)



# Calculating the PRS -----------------------------------------------------

allele_count <- c("0/0" = 0, "0/1" = 1, "1/1" = 2)

i <- 1
PRS_AD <- 0
for (rs in AD_VARIANTS_IN_PATIENT){
  
  beta <- Sumstats_SPIGAPUK2_20190625[Sumstats_SPIGAPUK2_20190625$RS == rs, 8]
  print(beta)
  PRS_AD <- PRS_AD + (as.integer(allele_count[AD_VARIANT_GENOTYPE[i]])*beta)
  i <- i + 1
  
}


# Exponentiating the PRS to get the odds of AD for this patient
OR <- exp(PRS_AD)
# Printing the result
print(OR)





