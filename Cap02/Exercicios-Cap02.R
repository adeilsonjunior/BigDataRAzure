# Lista de Exercícios - Capítulo 2

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros
vetor_integer  = c(1:30)
vetor_integer
typeof(vetor_integer)

# Exercício 2 - Crie uma matriz com 4 linhas e 
# 4 colunas preenchida com números inteiros

matriz = matrix(1:4,4,4,byrow = TRUE)
tipo = typeof(matriz)
tipo


# Exercício 3 - Crie uma lista unindo o vetor e matriz criados 
# anteriormente

combinado = c(vetor_integer, matriz)
combinado
typeof(combinado)
class(combinado)
mode(combinado)

combinado2 = list(vetor_integer, matriz)
combinado2

?list


# Exercício 4 - Usando a função read.table() leia o arquivo do 
# link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat

?read.table

x = read.table("https://grodri.github.io/datasets/effort.dat")
x
typeof(x)
class(x)
mode(x)
View(x)

df = data.frame(read.table("https://grodri.github.io/datasets/effort.dat"))
df

typeof(df)
class(df)





# Exercício 5 - Transforme o dataframe anterior, em um dataframe 
# nomeado com os seguintes labels:
# c("config", "esfc", "chang")

names(x) <- c("config", "esfc", "chang")

x

# Exercício 6 - Imprima na tela o dataframe iris, 
# verifique quantas dimensões existem no dataframe iris e 
# imprima um resumo do dataset

iris
library(datasets)
data(iris)
?data
iris
summary(iris)

str(iris)
dim(iris)
length(iris)


# Exercício 7 - Crie um plot simples usando as duas primeiras 
# colunas do dataframe iris

plot(iris$Sepal.Length, iris$Sepal.Width)

hist(iris$Sepal.Length, iris$Sepal.Width)
hist(iris$Sepal.Width)

# Exercício 8 - Usando a função subset, crie um novo dataframe com o 
# conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()

?subset

iris_subset = subset(iris, Sepal.Length > 7)

iris_subset

# Exercícios 9 (Desafio) - Crie um dataframe que seja cópia do 
# dataframe iris e usando a função slice(), divida o dataframe em 
# um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()

library(dplyr)
iris_sliced = slice(subset(iris,1:15))
?slice

novo_iris = iris
novo_iris
install.packages("dplyr")
library(dplyr)
?slice
slice(novo_iris, 1:15)
novo_iris



# Exercícios 10 - Use a função filter no seu novo dataframe criado 
# no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter


RSiteSearch('filter')

filter(novo_iris, Sepal.Length > 7)


