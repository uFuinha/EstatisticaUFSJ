library(ggplot2)
library(reshape2)

setwd("~/Documents/Estatística/scripts")

# -----------------------------------
# LEITURA E TRATAMENTO DOS DATASETS
# -----------------------------------
# Para cada um dos algoritmos, há três conjuntos de dados, que representam os tempos 
# de execução da ordenação em sequências em ordem aleatória, crescente e decrescente.


# -----------------------------------
# INSERTION SORT
# -----------------------------------
randomTimes <- read.csv("../out/insertion/random.csv")
randomTimes$X <- NULL

ascendingTimes <- read.csv("../out/insertion/ascending.csv")
ascendingTimes$X <- NULL

descendingTimes <- read.csv("../out/insertion/descending.csv")
descendingTimes$X <- NULL

# Cálculo da média de cada coluna
table_INSERT <- data.frame(matrix(nrow = 8, ncol = 4))
colnames(table_INSERT) = c("size", "random", "ascending", "descending")

table_INSERT$size <- c(20, 50, 100, 300, 500, 1000, 3000, 5000)
table_INSERT$random <- colMeans(randomTimes)
table_INSERT$ascending <- colMeans(ascendingTimes)
table_INSERT$descending <- colMeans(descendingTimes)

table_INSERT <- melt(table_INSERT, id = "size")

insertion_plot = ggplot(data = table_INSERT, aes(x = size, y = value, color = variable)) +
  geom_line() +
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(linewidth = 0.3, colour = "black"),
    axis.title.x = element_text(vjust = -5, family = "Libre Baskerville"),
    axis.title.y = element_text(angle = 90, vjust = 5, family = "Libre Baskerville"),
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    plot.title = element_text(hjust = 0, family = "Libre Baskerville", face = "bold", size = 16, vjust = 4),
    plot.subtitle = element_text(hjust = 0, family = "Libre Baskerville", vjust = 5),
    legend.position = "right",
    legend.text = element_text(family = "Libre Baskerville"),
    legend.title = element_text(family = "Libre Baskerville"),
    legend.key = element_rect(fill = "#efefef"),
    legend.background = element_rect(fill = "#efefef")
  ) +
  labs(
    x = "Tamanho da entrada", 
    y = "Tempo (ms)",
    title = "INSERTIONSORT: tempo de execução",
    subtitle = "Medida de tempo (ms) em relação à quantidade de elementos da entrada"
  ) +
  scale_color_discrete(
    name = "Natureza do conjunto\nde entrada",
    labels = c("Aleatória", "Ordem crescente", "Ordem decrescente")
  )
insertion_plot

# -----------------------------------
# MERGE SORT
# -----------------------------------
randomTimes_MERGE <- read.csv("../out/merge/random.csv")
randomTimes_MERGE$X <- NULL

ascendingTimes_MERGE <- read.csv("../out/merge/ascending.csv")
ascendingTimes_MERGE$X <- NULL

descendingTimes_MERGE <- read.csv("../out/merge/descending.csv")
descendingTimes_MERGE$X <- NULL

# Cálculo da média de cada coluna
table_MERGE <- data.frame(matrix(nrow = 8, ncol = 4))
colnames(table_MERGE) = c("size", "random", "ascending", "descending")

table_MERGE$size <- c(20, 50, 100, 300, 500, 1000, 3000, 5000)
table_MERGE$random <- colMeans(randomTimes_MERGE)
table_MERGE$ascending <- colMeans(ascendingTimes_MERGE)
table_MERGE$descending <- colMeans(descendingTimes_MERGE)

table_MERGE <- melt(table_MERGE, id = "size")

insertion_plot = ggplot(data = table_MERGE, aes(x = size, y = value, color = variable)) +
  geom_line() +
  theme(
    panel.background = element_blank(),
    panel.border = element_blank(),
    axis.line = element_line(linewidth = 0.3, colour = "black"),
    axis.title.x = element_text(vjust = -5, family = "Libre Baskerville"),
    axis.title.y = element_text(angle = 90, vjust = 5, family = "Libre Baskerville"),
    plot.margin = unit(c(1, 1, 1, 1), "cm"),
    plot.title = element_text(hjust = 0, family = "Libre Baskerville", face = "bold", size = 16, vjust = 4),
    plot.subtitle = element_text(hjust = 0, family = "Libre Baskerville", vjust = 5),
    legend.position = "right",
    legend.text = element_text(family = "Libre Baskerville"),
    legend.title = element_text(family = "Libre Baskerville"),
    legend.key = element_rect(fill = "#efefef"),
    legend.background = element_rect(fill = "#efefef")
  ) +
  labs(
    x = "Tamanho da entrada", 
    y = "Tempo (ms)",
    title = "INSERTIONSORT: tempo de execução",
    subtitle = "Medida de tempo (ms) em relação à quantidade de elementos da entrada"
  ) +
  scale_color_discrete(
    name = "Natureza do conjunto\nde entrada",
    labels = c("Aleatória", "Ordem crescente", "Ordem decrescente")
  )
insertion_plot