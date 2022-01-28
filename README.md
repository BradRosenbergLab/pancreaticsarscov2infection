
<!-- README.md is generated from README.Rmd. Please edit that file -->

This repository contains the data and code for our paper:

> Verena van der Heide, Sonja Jangra, Phillip Cohen, Raveen
> Rathnasinghe, Teresa Aydillo-Gomez, Daniel Geanon, Diana Handler,
> Geoffrey Kelley, Brian Lee, Adeeb Rahman, Travis Dawson, Jingjing Qui,
> Darwin D’souza, Seunghee Kim-Schulze, Julia Panzer, Alejandro Caicedo,
> Irina Kusmartseva, Amanda Posgai, Mark Atkinson, Randy A. Albrecht,
> Adolfo García-Sastre, Brad R. Rosenberg, Michael Schotsaert & Dirk
> Homann, (2022). **Limited Extent and Consequences of Pancreatic
> SARS-CoV-2 Infection**. Cell Reports

Our pre-print is online here:

> Verena van der Heide, Sonja Jangra, Phillip Cohen, Raveen
> Rathnasinghe, Teresa Aydillo-Gomez, Daniel Geanon, Diana Handler,
> Geoffrey Kelley, Brian Lee, Adeeb Rahman, Travis Dawson, Jingjing Qui,
> Darwin D’souza, Seunghee Kim-Schulze, Julia Panzer, Alejandro Caicedo,
> Irina Kusmartseva, Amanda Posgai, Mark Atkinson, Randy A. Albrecht,
> Adolfo García-Sastre, Brad R. Rosenberg, Michael Schotsaert & Dirk
> Homann, (2022). **Limited Extent and Consequences of Pancreatic
> SARS-CoV-2 Infection**. Available at SSRN:
> <https://ssrn.com/abstract=3945929> or
> <http://dx.doi.org/10.2139/ssrn.3945929>

The code included in analysis/paper/paper.Rmd recreates figures involved
in the single-cell RNA sequencing (scRNAseq) analysis fo van der Heide
et al, Cell Reports 2022. In this work, we annotated human pancreatic
islets infected or mock infected with SARS-CoV-2. We identified infected
cell types including alpha and beta cells and explored genes
differentially expressed within each cell type between infected and
uninfected cells per donor. Processed gene x cell matrices can be
downloaded from GEO (accession number
[GSE194061](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE194061)).
We also include customized SARS-CoV-2 reference files
(Reference/SARSCoV2\_Reference/Kim\_3P\_Chop.fa and
Reference/SARSCoV2\_Reference/Kim\_3P\_Chop.gtf) developed from
empirically defined SARS-CoV-2 transcripts identified by [Kim et al,
Cell
2020](https://www.cell.com/cell/fulltext/S0092-8674(20)30406-2?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0092867420304062%3Fshowall%3Dtrue#secsectitle0035)
with modifications to reduce redundancy as detailed in our manuscript.

Research compendium git repository based in part on [the rrools
package.](https://github.com/benmarwick/rrtools)
