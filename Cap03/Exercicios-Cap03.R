# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap02")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
vet_char = c("A", "B", "C")
vet_logi = c(TRUE, FALSE, TRUE)
vet_num = c(1,2,3)

df = data.frame(vet_char, vet_logi, vet_num)
df

# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.

# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

for (i in 1:length(vec1)){
  if (vec1[i]>10){
    print(vec1[i])
    print("é um número maior que 10")
  }
  else{
    print(vec1[i])
    print("é um número menor que 10")
  } 
}

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
for (i in 1:length(lst2)){
  print(lst2[[i]])
}

lst2

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:25), nrow = 5, ncol = 5, byrow = T)
mat1
?t
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat3 = mat1 * mat2
mat3



# Multiplicação de matrizes

mat4 = mat1 %*% mat2
mat4


# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
vec1 = c(12,3,4,19,34)
names(vec1) = c('c1', 'c2', 'c3', 'c4', 'c5')
vec1

mat1 = matrix(c(1:5), nrow = 5, ncol = 5, byrow = T)
mat1
dimnames(mat1) = (list(c('obs1', 'obs2', 'obs3', 'obs4', 'obs5'), c('v1', 'v2', 'v3', 'v4', 'v5')))
mat1

list1 = list(2,3,c(1,2,3))
list1
names(list1) = c('dim1','dim2','dim3')
list1

df1 = data.frame(c('a','b','c'), c(1.1,1.2,1.3), c(TRUE, FALSE, TRUE))
colnames(df1) = c('caracteres','float','logico')
rownames(df1) = c('obs1', 'obs2', 'obs3')
df1




# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2
mat2[sample(1:50,10)] = NA
mat2


# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
rowSums(mat1)
colSums(mat1)

# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
order(a)
a[order(a)]

# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
for (i in mat1){
  if(i > 15){
    print(i)
  }
}

