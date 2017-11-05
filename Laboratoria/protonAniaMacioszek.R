login = employees[employees$name == "John" & employees$surname == "Insecure","login"]
proton(action="login", login=login)
##
for (password in top1000passwords) {
  result = proton(action = "login", login = login, password = password)
  if (result == 'Success! User is logged in!')
    break
}
###

pietraszko_login = employees[employees$surname == "Pietraszko", "login"]

logs %>%
  group_by(login, host) %>%
  summarise(n=n()) %>%
  filter(login == pietraszko_login) %>%
  arrange(desc(n)) -> hosts

host = hosts[1, "host"]


###

tmp <- strsplit(bash_history, split=" ")
commands <- unique(unlist(lapply(tmp, function(x) x[1])))
commands
proton(action="login", login=pietraszko_login, password="DHbb7QXppuHnaXGN")