### Łukasz Bożyk (360947)
### Laboratorium nr 5

library(BetaBit)

proton()

# Problem 1.

login <- employees[employees$name=="John"&employees$surname=="Insecure",]$login
proton(action = "login", login=login)

# Problem 2.

for(password in top1000passwords) {
  if(proton(action = "login", login = login, password = password)!="Password or login is incorrect")
  {p <- password}
}

# Problem 3.

pietraszko.login <- employees[employees$surname=="Pietraszko",]$login

library(dplyr)
library(tidyr)

host <- logs %>%
  group_by(login,host) %>%
  summarize(logs=n()) %>%
  filter(login==pietraszko.login) %>%
  arrange(desc(logs)) %>%
  head(1)

proton(action = "server", host=as.character(host$host[1]))

# Problem 4.

strings <- unlist(strsplit(bash_history, split="[^A-Za-z0-9]+"))

potential.passwords <- unique(strings)

for(password in potential.passwords) {
  if(proton(action = "login", login = pietraszko.login, password = password)!="Password or login is incorrect")
  {pietraszko.password <- password}
}
