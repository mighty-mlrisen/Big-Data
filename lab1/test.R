
#set.seed(123)  
vect <- rnorm(1000, mean = 0, sd = 1)  

hist(vect, main = "Гистограмма нормального распределения", 
     xlab = "Значения", ylab = "Частота", col = "lightblue", border = "black")
print(vect)