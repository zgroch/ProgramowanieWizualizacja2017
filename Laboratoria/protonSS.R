```{r}
library(BetaBit)
library(dplyr)

proton()
filter(employees, surname=="Insecure")
proton(action = "login", login="johnins")

for (access in top1000passwords) {
  proton(action = "login", login="johnins", password=access)
}

filter(employees, surname=="Pietraszko")

logs %>%
  filter(login=="slap") %>%
  group_by(host) %>%
  summarise(n=n()) %>%
  arrange(desc(n))

proton(action = "server", host="194.29.178.16")

strsplit(bash_history, " ")
for (access in bash_history) {
  proton(action = "login", login="slap", password=access)
}
```