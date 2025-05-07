#вариант 10
# Генерация случайного вектора из натуральных чисел от 1 до 100
#set.seed(123)  # 
vect <- sample(1:100, size = 20, replace = TRUE) 



nums_for_division <- as.numeric(unlist(strsplit(readline("Введите числа от 2 до 5 для проверки кратности (через пробел): "), " ")))


count <- sum(sapply(vect, function(x) any(x %% nums_for_division == 0)))


cat("Случайный вектор:", vect, "\n")
cat("Количество чисел, кратных хотя бы одному из введенных чисел:", count, "\n")
