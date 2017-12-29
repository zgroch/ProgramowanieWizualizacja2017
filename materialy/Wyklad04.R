koty_ptaki <- read.table(file = "http://biecek.pl/MOOC/dane/koty_ptaki.csv", 
                         sep=";", header = TRUE)
koty_ptaki <- read.table(file = "http://biecek.pl/MOOC/dane/koty_ptaki.csv", 
                         sep=";", dec=",", header=TRUE)
# Wypiszmy zawartość symbolu koty_ptaki
koty_ptaki










# -------------

# W 80 dni dookoła świata
w80dni <- readLines("http://www.gutenberg.org/cache/epub/103/pg103.txt")

# Kilka pierwszych linii
head(w80dni)
# rozbicie linii na słowa
slowa <- unlist(strsplit(w80dni, split="[^A-Za-z0-9]+"))
# liczba słów i charakterystyki
length(slowa)

head(sort(table(slowa), decreasing = TRUE), 1000)




## [1] 68460

# Najczęstsze słowa
head(sort(table(slowa), decreasing = TRUE), 50)


# ------------

library(openxlsx)
ludnosc <- read.xlsx("LUDN_2137_20160225144358.xlsx", sheet = 2)
head(ludnosc)

ludnoscSzeroka <- read.xlsx("LUDN_2137_20160225144358.xlsx", sheet = 3)
ludnoscSzeroka[3:8,1:10]


# --------

library(RPostgreSQL)
dbname = "sejmrp"
user = "reader"
password = "qux94874"
host = "services.mini.pw.edu.pl"

sterownik <- dbDriver("PostgreSQL")
polaczenie <- dbConnect(sterownik, dbname = dbname, user = user, password = password, host = host)

gadki <- dbGetQuery(polaczenie, 
                    "SELECT * FROM statements ORDER BY nr_term_of_office, 
                    id_statement limit 1")
gadki

glosy <- dbGetQuery(polaczenie, "SELECT club, vote, 
                    count(*) FROM votes GROUP BY club, vote limit 12")
glosy

dbDisconnect(polaczenie)


# -----------

library(dplyr)
polaczenie <- src_sqlite(path = 'zabawka.db')
auta1 <- tbl(polaczenie, "auta2012")

auta1 %>% 
  head(2)

# -----------

polaczenie <- src_postgres(dbname = dbname, 
                           host = host, user = user, password = password)
src_tbls(polaczenie)

glosy <- tbl(polaczenie, "votes")

glosy %>% 
  group_by(club, vote) %>% 
  summarise(liczba = n()) ->
  liczba_glosow

class(liczba_glosow)

liczba_glosow$query

explain(liczba_glosow)

collect(liczba_glosow) -> glosy



# -------------

library("rvest")
library("xml2")
library("jsonlite")

linie <- "10,17,33"
token2 <- "35dbb2ebd27b23cfbec359dbd560adf2d4a5b27b"

res <- GET(url = paste0("https://vavel.mini.pw.edu.pl/api/vehicles/v1/short/?line=", linie),
           add_headers(Authorization = paste("Token", token2)))
jsonlite::fromJSON(as.character(res))
# brigade line delay        status                 time      lon      lat
# 1      025   10     0       STOPPED 2017-09-25T23:47:39Z 21.00311 52.18877
# 2        8   17    90        MOVING 2017-09-26T00:04:51Z 20.99225 52.24342
# 3       17   17     0       STOPPED 2017-09-25T21:43:11Z 21.00261 52.18883
# 4        9   10     0        MOVING 2017-09-25T21:19:04Z 21.00261 52.18885
# 5       11   10     0        MOVING 2017-09-25T21:22:37Z 20.96954 52.23154
# 6      036   17     0        MOVING 2017-09-25T20:52:11Z 20.93416 52.29925

res <- GET(url = paste0("https://vavel.mini.pw.edu.pl/api/vehicles/v1/full/?line=", linie),
           add_headers(Authorization = paste("Token", token2)))
jsonlite::fromJSON(as.character(res))


# ------------

library(rvest)
premiery <- read_html("http://www.filmweb.pl/premiere")
filmy <- html_nodes(premiery, ".filmTitle")
html_text(filmy)

lego_movie <- read_html("http://www.imdb.com/title/tt1490017/")

htab <- html_nodes(lego_movie, "table")[[1]]
html_table(htab)



