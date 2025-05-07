# вектор vec3 = 3, 6, 9, ..., 27
vec3 <- seq(3, 27, by = 3)
print(vec3)
# Извлекаем 2, 5 и 7 значения вектора
values_2_5_7 <- vec3[c(2, 5, 7)]
print(values_2_5_7)

# Извлекаем предпоследнее значение вектора
penultimate_value <- vec3[length(vec3) - 1]
print(penultimate_value)

# Извлекаем все, кроме предпоследнего
all_except_penultimate <- vec3[-(length(vec3) - 1)] 
print(all_except_penultimate)

# все элементы вектора, кроме шестого
all_except_sixth <- vec3[-6]
print(all_except_sixth)

# извлечь сотое значение
value100 <- vec3[100]
print(value100)

# значения vec3, кроме первого и последнего
all_except_first_and_last <- vec3[-c(1, length(vec3))]
print(all_except_first_and_last)

# значения, которые > 4, но < 10
values_between_4_and_10 <- vec3[vec3 > 4 & vec3 < 10]
print(values_between_4_and_10)

# значения, которые < 4 или > 10
values_less_than_4_or_greater_than_10 <- vec3[vec3 < 4 | vec3 > 10]
print(values_less_than_4_or_greater_than_10)
