install.packages("BetaBit")
library(BetaBit)
library(dplyr)


#zad1
i <- (length(employees$name)-sum(cumsum((employees$name == "John") * (employees$surname == "Insecure"))))
login <- employees$login[i+1]
proton(action = "login", login = login)

#zad2
for(i in 1:length(top1000passwords)){
  proton(action = "login", login = login, password = top1000passwords[i])
}

#zad3
pietraszko_login <- employees %>%
  filter(surname == "Pietraszko") %>%
  select(login)
pietraszko_login <- pietraszko_login$login[1]

host <- logs %>%
  filter(login == pietraszko_login) %>%
  select(host) %>%
  group_by(host) %>%
  summarise(n = n()) %>%
  arrange(desc(n))
host <- as.vector(host$host)[1]

proton(action = "server", host = host)

#zad4
przez_spacja <- bash_history * t(substr(top1000passwords,1,length(bash_history)))
