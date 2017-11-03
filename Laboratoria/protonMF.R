library(BetaBit)
library(dplyr)
proton()

John_login = filter(employees, name == "John", surname == "Insecure")[, c("login")]
proton(action = "login", login = John_login)

i=1
while (proton(action = "login", login = John_login, password = top1000passwords[i]) == "Password or login is incorrect") { 
    i=i+1
}

Pietraszko_login <-  filter(employees, surname == "Pietraszko")[, c("login")]
hosty <- logs %>% 
  filter(login == Pietraszko_login) %>% 
  group_by(host) %>% 
  summarise(ilosc = n()) %>% 
  arrange(desc(ilosc))
proton (action = "server", host = as.character(hosty$host[1]))

beforeSpace <- grep("^[^ ]+$", bash_history, value = TRUE)
table(beforeSpace)
pass_Pietr <- "DHbb7QXppuHnaXGN"
proton(action = "login", login = Pietraszko_login, password = pass_Pietr)
