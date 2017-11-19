


library(BetaBit)
library(plyr)
library(dplyr)
library(tidyr)
proton()

head(employees)
login_John <- employees[employees$name=="John" & employees$surname=="Insecure","login"] 
proton(action="login", login=login_John)

passwords <- top1000passwords

 for(i in passwords) {
    try <- proton(action = "login", login = login_John, password=i)
  
   if(!grepl("incorrect", try)) {
     cat(i)
     password_john = i
     break()
   }
   
 }

head(logs)
login_pietraszko <- employees %>% 
  filter(surname=="Pietraszko")

host_pietraszko <- logs %>%
  filter(login==login_pietraszko$login) %>% 
  select(host) %>% 
  count(host) %>% 
  filter(n == max(n))

for (i in host_pietraszko$host){
  proton(action="server", host = i)
}

a <- gsub("\\s.*", "",bash_history)
table(a)

proton(action='login', login=login_pietraszko$login, password = "DHbb7QXppuHnaXGN")
 