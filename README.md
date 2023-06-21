# PhenoGraph

##### Description

PhenoGraph is a graph-based clustering method for flow cytometry data.

##### Usage

Input data|.
---|---
`row`   | represents the variables (e.g. channels, markers)
`col`   | represents the observations (e.g. cells) 
`y-axis`| is the value of measurement signal of the channel/marker

Operator Settings|.
---|---
`k`   | integer, number of nearest neighbours (default: 30)
`seed`   | integer, random seed
`implementation`   | Whether to use Rphenograph of FastPhenoGraph (FastPG) implementation.

Output data|.
---|---
`cluster_id`| Cluster ID

##### Details

This operator is a wrapper around the [PhenoGraph method](http://www.cell.com/cell/abstract/S0092-8674(15)00637-6), which is a clustering algorithm designed for high-dimensional single-cell data analysis. 

It works by creating a graph representing phenotypic similarities between cells by calculating the Jaccard coefficient between nearest-neighbor sets, and then identifying communities using the Louvain method. 



