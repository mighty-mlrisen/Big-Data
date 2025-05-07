# от 2 до 20
even_numbers <- seq(2, 20, by = 2)


v1 <- rep(0, length(even_numbers) * 2)  
v1[seq(2, length(v1), by = 2)] <- even_numbers

print(v1)




# 20 степеней двойки
v2 <- 2^(0:19)  
print(v2)



# Вектор 1, 10, 100, 1000, 10000
v3 <- 10^(0:4)
print(v3)
