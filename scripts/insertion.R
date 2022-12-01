library(ggplot2)

# -----------------------------------
# LEITURA E TRATAMENTO DOS DATASETS
# -----------------------------------
# Para cada um dos algoritmos, há três conjuntos de dados, que representam os tempos 
# de execução da ordenação em sequências em ordem aleatória, crescente e decrescente.

randomTimes <- read.csv("../out/insertion/random.csv")
randomTimes$X0 <- NULL

ascendingTimes <- read.csv("../out/insertion/ascending.csv")
ascendingTimes$X0 <- NULL

descendingTimes <- read.csv("../out/insertion/descending.csv")
descendingTimes$X0 <- NULL





means <- data.frame(
  size = c(20, 50, 100, 300, 500, 1000, 3000, 5000), 
  randomTime = as.matrix(colMeans(randomTimes))[, 1],
  ascendingTime = as.matrix(colMeans(ascendingTimes))[, 1],
  descendingTime = as.matrix(colMeans(descendingTimes))[, 1],
  row.names = NULL)

ggplot(data=means, aes(x=size, y=randomTime, group=1)) +
  geom_line(color = "blue") +
  geom_point()
ggplot(data=means, aes(x=size, y=ascendingTime, group=1)) +
  geom_line(color = "red") +
  geom_point()
ggplot(data=means, aes(x=size, y=descendingTime, group=1)) +
  geom_line(color = "green") +
  geom_point()
