# rphenograph operator

#### Description
`rephenograph` operator performs a phenotype clustering in the `Rphenograph` R package.

##### Usage
Input projection|.
---|---
`row`   | represents the variables (e.g. channels, markers)
`col`   | represents the observations (e.g. cells) 
`y-axis`| is the value of measurement signal of the channel/marker


Input parameters|.
---|---
`xdim`   | Width of the grid
`ydim`   | Hight of the grid
`rlen`| Number of times to loop over the training data for each MST
`mst`| Number of times to build an MST
`alpha_start`| Start learning rate
`alpha_end`|  End learning rate
`dstf`| Distance function (1=manhattan, 2=euclidean, 3=chebyshev, 4=cosine)

Output relations|.
---|---
`mapping_node_num`| numeric, per column (e.g. per cell)
`mapping_node_label`| character, per column (e.g. per cell)

##### Details
The operator is the `rphenograph` function of the `Rphenograh` R package.


#### References
see the `rphenograph::SOM` function of the R package for the documentation, 


##### See Also


#### Examples
