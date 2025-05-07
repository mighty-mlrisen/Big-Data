#1


i <- 1:50


sequence <- 1 / (i * (i + 1))

result <- sum(sequence)

print(result)


#2


i <- 0:20


sequence <- 1 / (2^i)


result <- sum(sequence)


print(result)

#3


i <- 0:9


numerator <- 3 * i + 1


denominator <- 3^i


sequence <- numerator / denominator


result <- sum(sequence)


print(result)

#  количество значений, которые больше 0,5
count_greater_than_05 <- sum(sequence > 0.5)


print(count_greater_than_05)


