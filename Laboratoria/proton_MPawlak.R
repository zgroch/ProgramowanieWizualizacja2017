install.packages("BetaBit")
proton()

# Problem 1: Find the login of John Insecure.

class(employees)
head(employees)

dane_logowania_JI <- employees[employees[,2] == "Insecure",]
dane_logowania_JI

proton(action = "login", login="johnins")

# Problem 2: Find John Insecure's password.

head(top1000passwords)

for (i in top1000passwords){
  proton(action = "login", login="johnins", password = i)
}

# Problem 3: Check from which server Pietraszko logs into the Proton server most often.

head(logs)

dane_logowania_Pietraszko <- employees[employees[,2] == "Pietraszko",]
dane_logowania_Pietraszko

Pietraszko_logi <- logs[logs[,1] == "slap",]

library(dplyr)

Pietraszko_logi %>%
  group_by(host) %>%
    summarise(n = n()) %>%
    arrange(desc(n)) 

proton(action = "server", host="194.29.178.16")

# Problem 4: Find the Pietraszko's password.

head(bash_history, 20)
class(bash_history)

Pietraszko_typed <- gsub(" .*", "", bash_history)
head(Pietraszko_typed, 20)

for (i in Pietraszko_typed){
  proton(action = "login", login="slap", password = i)
}


