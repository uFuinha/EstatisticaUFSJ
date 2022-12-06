library(ggplot2)
library(reshape2)

setwd("~/Documents/Estatística/scripts")

# -----------------------------------
# LEITURA E TRATAMENTO DOS DATASETS
# -----------------------------------
# Para cada um dos algoritmos, há três conjuntos de dados, que representam os tempos 
# de execução da ordenação em sequências em ordem aleatória, crescente e decrescente.

randomTimes <- read.csv("../out/insertion/random.csv")
randomTimes$X <- NULL

ascendingTimes <- read.csv("../out/insertion/ascending.csv")
ascendingTimes$X <- NULL

descendingTimes <- read.csv("../out/insertion/descending.csv")
descendingTimes$X <- NULL

# Cálculo da média de cada coluna
table <- data.frame(matrix(nrow = 8, ncol = 4))
colnames(table) = c("size", "random", "ascending", "descending")

table$size <- c(20, 50, 100, 300, 500, 1000, 3000, 5000)
table$random <- colMeans(randomTimes)
table$ascending <- colMeans(ascendingTimes)
table$descending <- colMeans(descendingTimes)

table <- melt(table, id = "size")

insertion_plot = ggplot(data = table, aes(x = size, y = value, color = "Natureza do conjunto de entrada")) +
  geom_line() +
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(linewidth = 0.3, colour = "black"),
    plot.title = element_text(hjust = 0, family = "Libre Baskerville", face = "bold", size = 16),
    plot.subtitle = element_text(hjust = 0, family = "Libre Baskerville"),
    legend.position = "right",
    legend.text = element_text(family = "Libre Baskerville")
  ) +
  labs(
    x = "Tamanho da entrada", 
    y = "Tempo (ms)",
    title = "INSERTIONSORT: tempo de execução",
    subtitle = "Medida de tempo (ms) em relação à quantidade de elementos da entrada"
  )