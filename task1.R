## variant 1 ##

a <- 2 * exp(5)
b <- a * 2
max(a, b)
sum(a, b)

help(sum)


c <- 15:25
sum(c)


help.search("sum")


d <- "smarfony Samsung"
save(d, file = "a.RData")
rm(d)
d <- load("a.RData")


library(gridExtra)
grid.arrange(
  tableGrob(head(mtcars, 10))
)


e <- seq(100, 20, -4)


f <- 9:5
g <- 11:16
h <- c(g, f)
show(h)


nazwa <- c("Samsung Galaxy S8", "Samsung Galaxy S8+", "Samsung Galaxy Note 8", "Samsung Galaxy S9", "Samsung Galaxy S9+",
           "Samsung Galaxy Note 9", "Samsung Galaxy S10", "Samsung Galaxy S10+", "Samsung Galaxy Note 10", "Samsung Galaxy S20")
wyświetlacz <- c("5.8 cala", "6.2 cala", "6.3 cala", "5.8 cala", "6.2 cala",
                 "6.4 cala", "6.1 cala", "6.4 cala", "6.3 cala", "6.2 cala")
pamięć_RAM <- c("4 GB", "4 GB", "6 GB", "4 GB", "6 GB",
                 "6 GB", "8 GB", "8 GB", "8 GB", "8 GB")
pamięć_wbudowana <- c("64 GB", "64 GB", "64 GB", "64 GB", "64 GB",
                       "128 GB", "128 GB", "128 GB", "256 GB", "128 GB")
aparat_foto <- c("12 MP", "12 MP", "12 MP", "12 MP", "12 MP",
                  "12 MP", "12 MP", "12 MP", "12 MP", "64 MP")
cena <- c(1999, 2299, 3099, 2499, 2899, 4199, 3499, 4199, 3699, 4199)
liczba_opinii <- c(20, 344, 298, 66, 384, 150, 276, 25, 22, 2222)
smartfony <- data.frame(nazwa, wyświetlacz, pamięć_RAM, pamięć_wbudowana, aparat_foto, cena, liczba_opinii)
mean(smartfony$cena)


nowy_smartfon <- data.frame(
  nazwa = "Samsung Galaxy S21",
  wyświetlacz = "6.2 cala",
  pamięć_RAM = "8 GB",
  pamięć_wbudowana = "128 GB",
  aparat_foto = "12 MP",
  cena = 4499,
  liczba_opinii = 150
)
smartfony <- rbind(smartfony, nowy_smartfon)
mean(smartfony$cena)


oceny_klientow <- seq(0, 5, by = 0.5)
smartfony$ocena_klientow <- sample(oceny_klientow, nrow(smartfony), replace = TRUE)
smartfony$ocena_klientow <- as.factor(smartfony$ocena_klientow)
tapply(smartfony$cena, smartfony$ocena_klientow, mean)


oceny_klientow <- seq(0, 5, by = 0.5)
nowe_smartfony <- data.frame(nazwa = c("Samsung Galaxy A50", "Samsung Galaxy A51", "Samsung Galaxy A70", "Samsung Galaxy A71"),
                             wyświetlacz = c("6.4 cala", "6.5 cala", "6.7 cala", "6.7 cala"),
                             pamięć_RAM = c("4 GB", "4 GB", "6 GB", "6 GB"),
                             pamięć_wbudowana = c("128 GB", "128 GB", "128 GB", "128 GB"),
                             aparat_foto = c("25 MP", "48 MP", "32 MP", "64 MP"),
                             cena = c(1799, 1999, 2499, 2799),
                             liczba_opinii = c(20, 245, 1, 99))
nowe_smartfony$ocena_klientow <- sample(oceny_klientow, nrow(nowe_smartfony), replace = TRUE)
nowe_smartfony$ocena_klientow <- as.factor(nowe_smartfony$ocena_klientow)
tapply(nowe_smartfony$cena, nowe_smartfony$ocena_klientow, mean)
smartfony <- rbind(smartfony, nowe_smartfony)
barplot(table(smartfony$ocena_klientow),
  main = "Liczebnosc reprezentantow kazdej z ocen klientow",
  ylim = c(0, 50),
  xlab = "Ocena",
  ylab = "Ilość",
  col = rainbow(8)
)


perc <- table(smartfony$ocena_klientow) / length(smartfony$ocena_klientow)
pie(perc,
  main = "Udzial kazdej oceny",
  col = rainbow(8),
)
install.packages("plotrix")
library(plotrix)
fan.plot(perc, labels = names(perc))

smartfony$status_opinii <- ifelse(smartfony$liczba_opinii == 0, "nie ma",
                           ifelse(smartfony$liczba_opinii < 50, "mniej 50 opinii",
                           ifelse(smartfony$liczba_opinii < 100, "50-100 opinii", "wiecej niz 100 opinii")))
smartfony$status_opinii <- as.factor(smartfony$status_opinii)
perc <- table(smartfony$status_opinii) / length(smartfony$status_opinii)
pie(perc,
  main = "Udzial kazdej oceny",
  col = rainbow(8),
  labels = paste(names(perc), " ", round(perc * 100), "%")
)

zdania <- paste(
  smartfony$nazwa, "ma ocene klientow", smartfony$ocena_klientow,
  "bo ma liczbe opinii", smartfony$liczba_opinii
)
print(zdania)


write.csv(smartfony, "smartfony.csv", row.names = FALSE)
smartfony <- read.csv("smartfony.csv")


smartfony_euro <- data.frame(nazwa = c("realme 8", "Samsung Galaxy A32", "Samsung Galaxy A54", "iPhone 14 Plus", "Redmi 12C", "Samsung Galaxy M33", "Samsung Galaxy S23 Ultra", "OnePlus Nord CE 2 Lite 5G", "Motorola moto g72", "iPhone 11", "realme 9 Pro+", "Motorola moto G82 5G", "OnePlus 11 5G", "Xiaomi 13", "OPPO Find N2 Flip"),
                             wyświetlacz = c("6.4 cala", "6.6 cala", "6.4 cala", "6.7 cala", "6.71 cala", "6.6 cala", "6.8 cala", "6.59 cala", "6.6 cala", "6.1 cala", "6.4 cala", "6.6 cala", "6.7 cala", "6.36 cala", "6.8 cala"),
                             pamięć_RAM = c("4 GB", "6 GB", "8 GB", "b/d", "3 GB", "6 GB", "8 GB", "6 GB", "8 GB", "4 GB", "6 GB", "6 GB", "16 GB", "8 GB", '8 GB'),
                             pamięć_wbudowana = c("64 GB", "128 GB", "128 GB", "128 GB", "64 GB", "128 GB", "256 GB", "128 GB", "128 GB", "64 GB", "128 GB", "128 GB", "256 GB", "256 GB", "256 GB"),
                             aparat_foto = c("64 MP", "48 MP", "50 MP", "12 MP", "50 MP", "50 MP", "200 MP", "64 MP", "108 MP", "12 MP", "50 MB", "50 GB", "50 MP", "50 MP", "50 MP"),
                             cena = c(888, 1899, 2399, 5299, 499, 1199, 6799, 1199, 1299, 2398, 1444, 1299, 4599, 4799, 4999),
                             liczba_opinii = c(47, 0, 0, 12, 0, 8, 4, 5, 42, 234, 8, 48, 7, 0, 1),
                             ocena_klientow = c(5, 0, 0, 3.8, 0, 5, 5, 4.5, 4.9, 5, 4.9, 4.9, 5, 0, 1)
)
