library(tercen)
library(dplyr)
library(reshape2)
library(Rphenograph) # https://github.com/i-cyto/Rphenograph
library(igraph)

#BiocManager::install("remotes")
#BiocManager::install("sararselitsky/FastPG")
library(FastPG)
library(tictoc)

options("tercen.workflowId" = "64fb41765904c84540e45f1e1800fcb8")
options("tercen.stepId"     = "6ab261c5-acf9-46f5-84ac-9c64302f4323")

ctx <- tercenCtx()

data <- ctx  %>% 
  select(.ci, .ri, .y) %>% 
  reshape2::acast(.ci ~ .ri, value.var = '.y', fill = NaN, fun.aggregate = mean) 

colnames(data) <- paste('c', colnames(data), sep = '')

k <- 30
if(!is.null(ctx$op.value('k'))) k <- as.numeric(ctx$op.value('k'))
seed <- 42
if(!is.null(ctx$op.value('seed'))) k <- as.numeric(ctx$op.value('seed'))
set.seed(seed)
num_threads<-1

tic("ori")
dataRpheno <- Rphenograph::Rphenograph(data, k = k)
toc()
tic("fast")
clusters <- fastCluster( data, k, num_threads )
toc()

membership_num <- as.numeric(membership(dataRpheno[[2]]))
cluster_id <-sprintf(paste0("c%0", max(nchar(as.character(membership_num))), "d"), membership_num)
#modularity_num <- modularity(dataRpheno[[2]])

data.frame(.ci = seq(from = 0, to = length(cluster_id) - 1), cluster_id)%>% # membership_num, , modularity_num) %>%
  ctx$addNamespace() %>%
  ctx$save()
