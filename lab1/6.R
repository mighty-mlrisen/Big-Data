
height_zones <- data.frame(
  Hmin = c(400, 500, 800, 1300, 1600, 2300, 2500, 3300),
  Hmax = c(500, 800, 1300, 1600, 2300, 2500, 3300, 5000),
  Zone = c("Степь и лесостепь", 
           "Низкогорные широколиственные леса", 
           "Среднегорные широколиственные леса", 
           "Смешанные леса", 
           "Криволесия", 
           "Субальпийские и альпийские луга", 
           "Субнивальная зона", 
           "Гляциально-нивальная зона")
)
cat("Высотные пояса:\n")
print(height_zones)

height <- as.numeric(readline("Введите высоту: "))


zone_result <- height_zones[height >= height_zones$Hmin & height <= height_zones$Hmax, ]

if (nrow(zone_result) > 0) {
  print(zone_result)
} else {
  cat("Высота вне диапазона\n")
}
