# Solução Lista de Exercícios - Capítulo 10 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/FCD/BigDataRAzure/Cap11")
getwd()


# Pacotes
install.packages("dplyr")
install.packages('nycflights13')
library('ggplot2')
library('dplyr')
library('nycflights13')
View(flights)
?flights

# Definindo o Problema de Negócio
# Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)

unique(flights$year)

# Verificar a estrutura do conjunto de dados flights
str(flights)

# Filtrar os dados para obter apenas os voos da Delta Airlines (DL) e da United Airlines (UA)
voos_delta <- subset(flights, carrier == "DL")
voos_united <- subset(flights, carrier == "UA")

# Verificar a média de atraso para cada companhia aérea
media_atraso_delta <- mean(voos_delta$arr_delay, na.rm = TRUE)
media_atraso_united <- mean(voos_united$arr_delay, na.rm = TRUE)

print(media_atraso_delta)
print(media_atraso_united)

# Teste de hipótese
t.test(voos_delta$arr_delay, voos_united$arr_delay, alternative = "greater", na.action = na.omit)

##### ATENÇÃO #####
# Você vai precisar do conhecimento adquirido em outros capítulos do curso 
# estudados até aqui para resolver esta lista de exercícios!


# Exercício 1 - Construa o dataset pop_data com os dados de voos das 
# companhias aéreas UA (United Airlines) e DL (Delta Airlines). 
# O dataset deve conter apenas duas colunas, nome da companhia e atraso nos voos de chegada.
# Os dados devem ser extraídos do dataset flights para construir o dataset pop_data
# Vamos considerar este dataset como sendo nossa população de voos

pop_data <- flights[flights$carrier %in% c("DL", "UA"), c("carrier", "arr_delay")]
View(pop_data)


# Exercício 2  - Crie duas amostras de 1000 observações cada uma a partir do 
# dataset pop_data apenas com dados da companhia DL para amostra 1 e apenas dados 
# da companhia UA na amostra 2

# Dica: inclua uma coluna chamada sample_id preenchida com número 1 para a primeira 
# amostra e 2 para a segunda amostra

# Criar amostra 1 (DL)
amostra_dl <- pop_data %>%
  filter(carrier == "DL") %>%
  sample_n(1000, replace = FALSE) %>%
  mutate(sample_id = 1)

# Criar amostra 2 (UA) e adicionar a coluna sample_id
amostra_ua <- pop_data %>%
  filter(carrier == "UA") %>%
  sample_n(1000, replace = FALSE) %>%
  mutate(sample_id = 2)

View(amostra_dl)
View(amostra_ua)

# Exercício 3 - Crie um dataset contendo os dados das 2 amostras criadas no item anterior. 

# Combinar as duas amostras em um único conjunto de dados
amostras_combinadas <- bind_rows(amostra_dl, amostra_ua)
View(amostras_combinadas)

# Visualizar as primeiras linhas do conjunto de dados combinado
head(amostras_combinadas)


# Exercício 4 - Calcule o intervalo de confiança (95%) da amostra1

# Calcular o intervalo de confiança de 95% para a amostra 1 (DL)
intervalo_confianca_amostra1 <- t.test(amostra_dl$arr_delay)$conf.int

# Exibir o intervalo de confiança
print(intervalo_confianca_amostra1)
summary(intervalo_confianca_amostra1)

# Realizar o teste t
resultado_teste <- t.test(amostra_dl$arr_delay)

# Visualizar o resumo dos resultados
summary(resultado_teste)

# Usamos a fórmula: erro_padrao_amostra1 = sd(amostra1$arr_delay) / sqrt(nrow(amostra1))

# Esta fórmula é usada para calcular o desvio padrão de uma distribuição da média amostral
# (de um grande número de amostras de uma população). Em outras palavras, só é aplicável 
# quando você está procurando o desvio padrão de médias calculadas a partir de uma amostra de 
# tamanho n𝑛, tirada de uma população.

# Digamos que você obtenha 10000 amostras de uma população qualquer com um tamanho de amostra de n = 2.
# Então calculamos as médias de cada uma dessas amostras (teremos 10000 médias calculadas).
# A equação acima informa que, com um número de amostras grande o suficiente, o desvio padrão das médias 
# da amostra pode ser aproximado usando esta fórmula: sd(amostra) / sqrt(nrow(amostra))
  
# Deve ser intuitivo que o seu desvio padrão das médias da amostra será muito pequeno, 
# ou em outras palavras, as médias de cada amostra terão muito pouca variação.

# Com determinadas condições de inferência (nossa amostra é aleatória, normal, independente), 
# podemos realmente usar esse cálculo de desvio padrão para estimar o desvio padrão de nossa população. 
# Como isso é apenas uma estimativa, é chamado de erro padrão. A condição para usar isso como 
# uma estimativa é que o tamanho da amostra n é maior que 30 (dado pelo teorema do limite central) 
# e atende a condição de independência n <= 10% do tamanho da população.

# Erro padrão
erro_padrao_amostra_dl = sd(amostra_dl$arr_delay) / sqrt(nrow(amostra_dl))

print(erro_padrao_amostra_dl)

# Limites inferior e superior
# 1.96 é o valor de z score para 95% de confiança


# Intervalo de confiança



# Exercício 5 - Calcule o intervalo de confiança (95%) da amostra2


intervalo_confianca_amostra2 <- t.test(amostra_ua$arr_delay)$conf.int

print(intervalo_confianca_amostra2)


# Exercício 6 - Crie um plot Visualizando os intervalos de confiança criados nos itens anteriores
# Dica: Use o geom_point() e geom_errorbar() do pacote ggplot2


# Criar um dataframe com os intervalos de confiança
intervalos_confianca <- data.frame(
  sample_id = c(1, 2),
  lower = c(intervalo_confianca_amostra1[1], intervalo_confianca_amostra2[1]),
  upper = c(intervalo_confianca_amostra1[2], intervalo_confianca_amostra2[2])
)

View(intervalos_confianca)

# Plotar os intervalos de confiança
ggplot(intervalos_confianca, aes(x = factor(sample_id), y = lower, ymin = lower, ymax = upper)) +
  geom_point(aes(y = (lower + upper) / 2), color = "blue") +  # Pontos médios
  geom_errorbar(width = 0.2) +  # Intervalos de confiança
  labs(title = "Intervalos de Confiança", x = "Amostra", y = "Valor") +
  theme_minimal()



# Exercício 7 - Podemos dizer que muito provavelmente, as amostras vieram da mesma população? 
# Por que?

# Realizar o teste t de duas amostras
resultado_teste_t <- t.test(amostra_dl$arr_delay, amostra_ua$arr_delay)

# Visualizar o resumo dos resultados
print(resultado_teste_t)



# Exercício 8 - Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)


# Realizar o teste t de duas amostras
resultado_teste_t <- t.test(voos_delta$arr_delay, voos_united$arr_delay, alternative = "greater", na.action = na.omit)

# Visualizar o resumo dos resultados
print(resultado_teste_t)



# H0 e H1 devem ser mutuamente exclusivas.

