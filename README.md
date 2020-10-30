# rphenograph operator

##### Description

`rphenograph` operator performs a phenotype clustering in the `Rphenograph` R package.

##### Usage

Input projection|.
---|---
`row`   | represents the variables (e.g. channels, markers)
`col`   | represents the observations (e.g. cells) 
`y-axis`| is the value of measurement signal of the channel/marker


Input parameters|.
---|---
`k`   | integer, number of nearest neighbours (default: 30)
`seed`   | integer, random seed

Output relations|.
---|---
`membership_num`| numeric, per column (e.g. per cell)
`membership_label`| character, per column (e.g. per cell)
`modularity_num`| numeric, per column (e.g. per cell)

##### Details

The operator is the `Rphenograph` function of the `Rphenograh` [R package](https://github.com/i-cyto/Rphenograph).


