# GeneRIF

What is GeneRIF: https://www.ncbi.nlm.nih.gov/gene/about-generif -  GeneRIF provides a simple mechanism to allow scientists to add to the functional annotation of genes described in Gene 

Gene symbols and their alternatives - HGNC - https://www.genenames.org/

#### Example usage

Find out information about genes from within region of interest, eg. chr19:1000000-7000000

Find which genes are within the region of interest: 

Go to http://www.ensembl.org/biomart/

Get Gene symbols

![Ensembl](img/ensembl.png)

save as chr19_1-7mb.genesymbols.txt into filtering folder

Run the query:

```
filter_multiple_genes.sh chr19_1-7mb.genesymbols.txt
```

Find the results in filtering folder
