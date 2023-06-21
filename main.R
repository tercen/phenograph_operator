library(tercen)
library(dplyr)
library(igraph)
library(Rphenograph)
library(FastPG)

ctx <- tercenCtx()

data <- ctx$as.matrix(fill = NaN) %>% t()

colnames(data) <- paste('c', seq_len(ncol(data)), sep = '')

k <- ctx$op.value('k', as.numeric, 30)
implementation <- ctx$op.value('implementation', as.character, "Rphenograph")

seed <- ctx$op.value('seed', as.integer, 42)
if(seed > 0) set.seed(seed)

if(implementation == "Rphenograph") {
  dataRpheno <- Rphenograph::Rphenograph(data, k = k)
  clust <- as.numeric(dataRpheno[[2]]$membership)
} else {
  clust <- FastPG::fastCluster(data, k = k, num_threads = ctx$availableCores() %/% 2)$communities
}

cluster_id <- sprintf(paste0("c%0", max(nchar(as.character(clust))), "d"), clust)

data.frame(.ci = seq(from = 0L, to = length(cluster_id) - 1L), cluster_id) %>%
  ctx$addNamespace() %>%
  ctx$save()
