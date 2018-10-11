set.seed(42)
library(tercen)
library(reshape2)
library(Rphenograph)

data = (ctx = tercenCtx())  %>% 
  select(.ci, .ri, .y) %>% 
  reshape2::acast(.ci ~ .ri, value.var='.y', fill=NaN, fun.aggregate=mean) 

colnames(data) = paste('c', colnames(data), sep='')

dataRpheno = Rphenograph::Rphenograph(data, k = as.integer(ctx$op.value('k')))

membership_num   = as.numeric(membership(dataRpheno[[2]]))
membership_label = as.character(membership_num)
modularity_num   = modularity(dataRpheno[[2]])


data.frame(.ci = seq(from=0,to=length(membership_num)-1), membership_num, membership_label, modularity_num) %>%
  ctx$addNamespace() %>%
  ctx$save()
