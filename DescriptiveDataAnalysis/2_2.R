library(ggplot2)
library(tidyr)
library(dplyr)
library(ggpubr)
df <- read.csv("data2.csv", header = TRUE, sep = ",")

str(df)

options(width = 200)

data <- df[,-1]
df_numeric <- apply(data, 2, as.numeric)
df_numeric <- as.data.frame(df_numeric)

print(df)
cat("\n\n\n")

#Дескриптивный анализ

summary_stats <- summary(df_numeric)
print(summary_stats)


find_all_modes2 <- function(x) {
  tab <- table(x)
  modes <- as.numeric(names(tab[tab == max(tab)]))  # Преобразуем в числа
  return(modes)
}

modes_all2 <- apply(df_numeric, 2, find_all_modes2)
modes_df <- data.frame(variable = names(modes_all2), mode = sapply(modes_all2, function(x) paste(x, collapse = ", ")))
print("Мода:")
print(modes_df, row.names = FALSE)


std_dev_values <- apply(df_numeric, 2, sd, na.rm = TRUE)
print("Стандартное отклонение:")
print(std_dev_values)


range_values <- apply(df_numeric, 2, function(x) max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
print("Размах:")
print(range_values)

variance_values <- apply(df_numeric, 2, var, na.rm = TRUE)

print("Дисперсия:")
print(variance_values)

# гистограммы
for (col in colnames(df_numeric)) {
  p <- ggplot(df_numeric, aes(x = as.factor(.data[[col]]))) + 
    geom_bar(fill = "lightblue", color = "black", position = "dodge") + 
    labs(title = paste("Рис. Гистограмма всех оценок для", col), 
         x = "Оценка", y = "Частота")
  #print(p) 
}



#par(mfrow = c(2,1))


for (col in colnames(df_numeric)) {
  
  # Разделяем графическое окно на 2 части (2 строки, 1 колонка)
  par(mfrow = c(2, 1))
  
  # Гистограмма
  hist(df_numeric[[col]], 
       main = paste("Гистограмма оценок для", col), 
       xlab = "Оценка", 
       ylab = "Частота", 
       col = "lightblue", 
       border = "black",)
       #breaks = seq(floor(min(df_numeric[[col]])), ceiling(max(df_numeric[[col]])), by = 1))  
  
  
  # Boxplot
  boxplot(df_numeric[[col]], 
          main = paste("Boxplot для", col), 
          col = "lightblue", 
          las = 2, 
          cex.axis = 0.7)
  
  par(mfrow = c(1, 1))  
}


# Boxplot
boxplot(df_numeric, main = "Boxplot всех переменных", col = "lightblue", las = 2, cex.axis = 0.7)

#сортировка 

df_sorted <- df_numeric[order(df_numeric$`Сбер`), ]
print(df_sorted)

#подмножества данных 

sel_subset1 <- subset(df, `ВТБ` > 7)
print("Студенты со значением в ВТБ > 7:")
print(sel_subset1)
print(dim(sel_subset1))

sel_subset2 <- subset(df, `Юникредит` < 3)
print("Студенты со значением в Юникредит  < 3:")
print(sel_subset2)
print(dim(sel_subset2))

sel_subset3 <- subset(df, `ВТБ` > 7, select = c("Фамилия", "ВТБ"))
print("Студенты со значением в ВТБ > 7:")
print(sel_subset3)
print(dim(sel_subset3))


sel_subset4 <- subset(df, `Сбер` > 7, select = c("Фамилия", "Юникредит"))
print("Студенты со значением в Сбер > 7:")
print(sel_subset4)
print(dim(sel_subset4))

#операции 

merged_subset <- merge(sel_subset3, sel_subset4, by = "Фамилия")
print("Слияние по горизонталичы:")
print(merged_subset)
print(dim(merged_subset))

merged_subset2 <- rbind(sel_subset1, sel_subset2)
print("Слияние по вертикали:")
print(merged_subset2)
print(dim(merged_subset2))

bank_names <- names(merged_subset2) %in% c("ВТБ","Сбер")
new_data <- merged_subset2[!bank_names]
print("Исключение переменных:")
print(new_data)
print(dim(new_data))





