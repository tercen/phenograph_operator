library(tercen)
library(dplyr)
library(reshape2)
library(Rphenograph) # https://github.com/i-cyto/Rphenograph
library(igraph)

data = (ctx = tercenCtx())  %>% 
  select(.ci, .ri, .y) %>% 
  reshape2::acast(.ci ~ .ri, value.var = '.y', fill = NaN, fun.aggregate = mean) 

colnames(data) = paste('c', colnames(data), sep = '')

data <- as.matrix(iris[,1:4])

k <- 30
if(!is.null(ctx$op.value('k'))) k <- ctx$op.value('k')
seed <- 42
if(!is.null(ctx$op.value('seed'))) k <- ctx$op.value('seed')
set.seed(seed)

dataRpheno = Rphenograph::Rphenograph(data, k = k)

membership_num = as.numeric(membership(dataRpheno[[2]]))
membership_label = as.character(membership_num)
modularity_num = modularity(dataRpheno[[2]])

data.frame(.ci = seq(from = 0, to = length(membership_num) - 1), membership_num, membership_label, modularity_num) %>%
  ctx$addNamespace() %>%
  ctx$save()
