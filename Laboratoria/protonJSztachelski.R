proton()
#zadanie 1
library(dplyr)
dplyr::filter(employees, employees$surname == "Insecure") %>%
  select(login) -> wynik1

proton(action = "login", login = wynik1)  

#zadanie 2
for (pass in top1000passwords){
  proton(action = "login", login = wynik1, password = pass) -> ifcor
  if (ifcor == "Success! User is logged in!"){
    break()
  }
}

#zadanie 3
filter(employees, surname == "Pietraszko")

logs %>%
  filter(login == "slap") %>%
  group_by(host) %>%
  summarise(n = n()) %>%
  filter(n == max(n)) -> wynik3

proton(action = "server", host = "194.29.178.16")

#zadanie 4
i <- 1
strings <- unlist(strsplit(bash_history, " "))

for (pass in tmp){
  proton(action = "login", login = "slap", password = pass) -> ifcor
  if (ifcor == "Success! User is logged in!"){
    break()
  }
}
#z wektora usuwamy stringi o mniej niż 6 znakach, 
#by przyspieszyć liczenie pętli na górze(tak strzelam, że hasło zapewne jest dłuższe)
tmp <- seq(1:40000)
i <- 1
for(ppass in strings) {
  if(nchar(ppass) > 5) {
    tmp[i] <- ppass
    i <- i+1
  }
}
tmp <- tmp[1:15500]

#DHbb7QXppuHnaXGN