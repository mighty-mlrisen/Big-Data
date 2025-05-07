df <- read.csv("data.csv", header = TRUE, sep = ",")

str(df)

options(width = 200)
print(df)
cat("\n\n\n")

#строки без na
df2 <-df[rowSums(is.na(df)) == 0,]
print(df2)
cat("\n\n\n")

#max ,min,mean
bank_stats <- data.frame(
  Max = sapply(df[,-1], max, na.rm = TRUE),
  Min = sapply(df[,-1], min, na.rm = TRUE),
  Mean = sapply(df[,-1], mean, na.rm = TRUE)
)

print(bank_stats)
cat("\n\n\n")

# > 0.7 && < 0.3

count_above_7 <- sapply(df[,-1], function(x) sum(x > 7, na.rm = TRUE))  
count_below_3 <- sapply(df[,-1], function(x) sum(x < 3, na.rm = TRUE))

result_df <- data.frame(  
  Выше_7 = count_above_7,  
  Ниже_3 = count_below_3
)

print(result_df)
cat("\n\n\n")

# выборка
selected_rows <- df[df$Альфа.Банк > 7 & df$Сбер < 5, ]
print(selected_rows)
cat("\n\n\n")

#sort

vector_sort <- sort(colMeans(df[,-1], na.rm = TRUE), decreasing = TRUE)

print(vector_sort)

#Столбчатая диаграмма оценок

categories <- names(vector_sort) 
#scores <- as.numeric(vector_sort)  

barplot(scores, names.arg = categories, las = 2, col = "darkgreen",
        main = "Диаграмма оценок банков РФ", xlab = "", ylab = "Средний балл", cex.names = 0.6,ylim = c(0, max(scores) + 1))
