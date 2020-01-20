#/!/bin/sh

### a) download generif

echo "Updating GeneRif"
wget ftp://ftp.ncbi.nlm.nih.gov/gene/GeneRIF/generifs_basic.gz
gunzip generifs_basic.gz

# Filter just human genes
awk '{{if ($1 == "'"9606"'") {print $0}}}' generifs_basic > generifs_basic_human.txt

### b) download HGNC - Gene symbols and their NCBI/Entrez ID equivalents:

echo "Updating HGNC - Gene symbols and theri NCBI/Entrez ID equivalents"
wget ftp://ftp.ebi.ac.uk/pub/databases/genenames/new/tsv/locus_types/gene_with_protein_product.txt

# Select just columns with symbol and entrez_id to make it smaller

cut -f2,19 gene_with_protein_product.txt > gene_with_protein_product_simple.txt

#### Join the tables on entrez id column (2):

echo "Joining the tables on entrez id column"

# sort
sort -k2 generifs_basic_human.txt > generifs_basic_human_sorted.txt
sort -k2 gene_with_protein_product_simple.txt > gene_with_protein_product_simple_sorted.txt

# join on gene symbol

echo "Joining on Gene Symbol"
join -1 2 -2 2 gene_with_protein_product_simple_sorted.txt generifs_basic_human_sorted.txt  > generif_hgnc.txt

# Removing temporary and downloaded files

rm gene_with_protein_product_simple.txt generifs_basic_human.txt generifs_basic_human_sorted.txt gene_with_protein_product_simple_sorted.txt gene_with_protein_product.txt generifs_basic

# Create filtering folder

mkdir -p filtering

# Finished
echo "update.sh has finished"
