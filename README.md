# Calculating the PRS of Alzheimer's Disease for an individiual

This analysis is based on the following paper.

>de Rojas, I., Moreno-Grau, S., Tesi, N. et al. Common variants in Alzheimer’s disease and risk stratification by polygenic risk scores. Nat Commun 12, 3417 (2021). <https://doi.org/10.1038/s41467-021-22491-8>

# Steps to Run

1. You need to download the GWAS summary stats from [here](https://fundacioace-my.sharepoint.com/:u:/g/personal/iderojas_fundacioace_org/EaTwlPg9cRJHn7Kos4h39OUBaxajsjJHL_C110fC89bc8w?e=ZdcEUy)

This should be save under the data directory as "./data/Sumstats_SPIGAPUK2_20190625.txt"

2. You need to specify the path to your vcf file in **line 11** of PRScalculator.R

# Output

The script prints out the odds of AD for a given patient based on the presence of following SNPs.

![SNPs for PRS Calculation](https://github.com/deepmind11/PRS-Calculator-Alzheimers-Disease/blob/main/images/PRS_AD_GENES.png?raw=true)

In addition to these SNPs for APOE2 and APOE4 were used in the calculation.
