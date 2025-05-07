
time <- numeric(10)   
res <- numeric(10)    
num <- integer(10)

#1
t0<- Sys.time()  


xB <- seq(10, 120, by = 10)
product_xB <- prod(xB)
res[1] <- product_xB / (10^19)
t1 <- Sys.time()  
time[1] <- t1 - t0
num[1] <- 1


#2

count_xB <- length(xB)   
res[2] <- count_xB

t2 <- Sys.time() 
time[2] <- t2 - t1
num[2] <- 2

#3

mean_xB <- mean(xB)    
res[3] <- mean_xB

t3 <- Sys.time() 
time[3] <- t3 - t2
num[3] <- 3


#4


count_xB <- length(xB)
norm_vector <- rnorm(count_xB + 7, mean = 5)
sd_rounded <- round(sd(norm_vector))

res[4] <- sd_rounded

t4 <- Sys.time() 
time[4] <- t4 - t3
num[4] <- 4


#5 

arr <- array(xB, dim = c(5, count_xB))

sum_values <- arr[c(1, 2, 3, 5), c(3, 5, 7, 12)]

log_sum <- log(sum(sum_values))
log_sum_rounded <- round(log_sum, 2)

res[5] <- log_sum_rounded

t5 <- Sys.time() 
time[5] <- t5 - t4
num[5] <- 5

#6

xB <- c(xB, rep(0, 3))  

matr <- matrix(xB, nrow = 5, byrow = TRUE)

matr <- matr[-c(1, 3, 5), ]

new_rows <- nrow(matr)
new_cols <- ncol(matr)

result <- new_rows + new_cols
res[6] <- result

t6 <- Sys.time() 
time[6] <- t6 - t5
num[6] <- 6

#7



test_fio <- data.frame(num, res, time)


print(test_fio)
