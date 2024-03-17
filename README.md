# Calculating the PRS of Alzheimer's Disease for an individiual

## Data I have

### Provided by Christin

1. The vcf file and an index for it.
2. For some reason I also have a CRAM index without the CRAM file. (Updtae: Now I have the CRAM file)

From the VCF files, I can get the genotype for the genes assocaited with AD.
If genotype not here then I can assume it to be the reference genotype.

The reference file was:
> ##reference=file:///mnt/ssd/MegaBOLT_scheduler/reference/G42_refdata/GCA_000001405.15_GRCh38_no_alt_plus_hs38d1_analysis_set.fna

### From the Nature Comm Paper

To calculate the PRS I need to know the genes associated with AD. **Supp Data 4&5** + APOE

- I should find this in the meta-GWAS study results. Get the effect size. How to interpret the results? **Supp Data 3**

How do i get the effect sizes? (betas) from this data?
> By taking the log of the odds ratios.

---------------------------

From PRS I need to give a percent risk. **(Figure 5 form the paper. That information will be useful)**
From the email.
Does the excel have this data? **Yes, Data 6**

> Please return percent risk vs. the average person

I assume this means I need to tell how much more likely than the normal person. 2x, 1.5x, etc.

### Steps to get PRS (GPT 3.5)

A polygenic risk score (PRS) is a numerical score that quantifies an individual's genetic risk for a particular trait or disease based on their genetic data, typically derived from genome-wide association study (GWAS) data. The computation of a PRS involves several steps:

1. GWAS Summary Statistics: GWAS studies identify genetic variants associated with a trait or disease by analyzing the genomes of a large number of individuals. These studies generate summary statistics that include information about the effect size and significance of each genetic variant.

2. Selection of Genetic Variants: A set of genetic variants is selected from the GWAS summary statistics to be included in the PRS calculation. The selection criteria may be based on a significance threshold, such as considering only variants surpassing a certain p-value threshold or considering a fixed number of top variants.

3. Effect Size Estimation: For each selected variant, the effect size (typically represented as beta or log odds ratio) obtained from the GWAS summary statistics is used. The effect size indicates the magnitude of the association between the variant and the trait or disease.

4. Allele Count Calculation: The individual's genotype data, usually in the form of single nucleotide polymorphisms (SNPs), is used to calculate the allele count for each selected variant. The allele count represents the number of risk alleles (associated with increased risk) carried by the individual.

5. Weighting and Summation: The effect size for each variant is multiplied by the individual's allele count for that variant, resulting in a weighted score. These weighted scores are then summed across all selected variants to obtain the polygenic risk score.

**How do I find this?**
6. Population-Specific Baseline: Depending on the specific PRS methodology, a population-specific baseline or reference distribution may be used to standardize the PRS. This step aims to account for differences in allele frequencies and effect sizes across populations.

7. Interpretation: The resulting PRS can be interpreted as a continuous score representing the genetic risk for the trait or disease. Higher PRS values indicate a higher genetic predisposition to the trait or disease of interest.

It's important to note that different PRS methods may vary in terms of the specific statistical models and weighting schemes employed. Additionally, PRS should be interpreted cautiously, as it represents only a portion of the overall risk and does not account for environmental factors or gene-gene interactions.

### Other Helpful Information

#### What is RS?

In the context of a Genome-Wide Association Study (GWAS), "RS" refers to Reference SNP cluster ID. These IDs are unique identifiers assigned by the National Center for Biotechnology Information (NCBI) to publicly available single nucleotide polymorphisms (SNPs). SNPs are the most common type of genetic variation among people. Each SNP represents a difference in a single DNA building block, called a nucleotide. For example, a SNP may replace the nucleotide cytosine (C) with the nucleotide thymine (T) in a certain stretch of DNA.

When you see a list of RS numbers like the one you've provided, each number is referencing a specific SNP that has been cataloged in the dbSNP database, which is a free public archive for genetic variation within and across different species maintained by NCBI.

In a GWAS, researchers look for differences in SNP frequencies between groups of individuals, usually those with a particular disease or trait and those without. If certain SNPs are found to be more common in people with the disease, those SNPs are said to be associated with the disease.

The RS numbers you provided can be used to look up information about each SNP, including its location on the genome, the gene(s) it may be within or near, and any known associations with diseases or other traits. To find information about a specific SNP, you can search the dbSNP database or other genomic databases like the Genome Aggregation Database (gnomAD) or the 1000 Genomes Project using the RS number as a query term.
