library(PogromcyDanych)
library(dplyr)

auta <- auta2012[,c("Cena.w.PLN", "KM", "Marka", "Model", "Przebieg.w.km",
            "Rodzaj.paliwa", "Rok.produkcji")]

head(auta, 2)

str(auta)

tanieAuto <- filter(auta, Cena.w.PLN < 50000)

tanieAuto <- filter(auta, Cena.w.PLN < 50000, Marka == "Ford")
tanieAuto <- filter(auta, Cena.w.PLN < 50000, Model %in% c("Focus", "Mondeo"))
tanieAuto <- filter(auta, (Cena.w.PLN < 50000) & ((Model == "Focus") | (Model == "Mondeo")))

tanieAuto <- filter(auta, Cena.w.PLN < 50000, !(Model %in% c("Focus", "Mondeo")))

tanieAuto <- select(auta, Marka:Przebieg.w.km, Rok.produkcji)
tanieAuto <- select(auta, -Rok.produkcji)

tanieAuto <- select(auta,Przebieg.w.km:Marka, Rok.produkcji, Model)

tanieAuto <- filter(auta, Cena.w.PLN < 50000)
tanieAuto <- select(tanieAuto, -Rok.produkcji)
tmp <- arrange(tanieAuto, Rodzaj.paliwa, desc(Cena.w.PLN))
head(tmp)

head(arrange(select(filter(auta, Cena.w.PLN < 50000 ), -Rok.produkcji), Rodzaj.paliwa, desc(Cena.w.PLN)),2)

noweAuta <- auta %>%
  filter(Cena.w.PLN < 50000 ) %>%
  select(-Rok.produkcji) %>%
  arrange(Rodzaj.paliwa, desc(Cena.w.PLN)) %>%
  head(2)

auta %>%
  filter(Cena.w.PLN < 50000 ) %>%
  select(-Rok.produkcji) %>%
  arrange(Rodzaj.paliwa, desc(Cena.w.PLN)) %>%
  head(2) -> noweAuta

lm(Cena.w.PLN~Rok.produkcji, data=auta)

auta %>%
  lm(Cena.w.PLN~Rok.produkcji, data=.)


auta %>%
  summarise(srCena = mean(Cena.w.PLN),
            n = n(), 
            mPrzebieg = median(Przebieg.w.km, na.rm=TRUE))

auta %>%
  group_by(Marka, Rodzaj.paliwa) %>%
  summarise(srCena = mean(Cena.w.PLN),
            n = n(), 
            mPrzebieg = median(Przebieg.w.km, na.rm=TRUE)) %>%
  filter(n > 20) %>%
  arrange(-srCena)

auta %>%
  group_by(Marka, Rodzaj.paliwa) %>%
  head(2)

auta %>% 
      group_by(Marka) %>%
  mutate(unormowana = Cena.w.PLN / mean(Cena.w.PLN))

auta %>% 
  mutate(Cena.w.EUR = Cena.w.PLN / 4) %>% head(4)

auta %>% 
  mutate(Cena.w.EUR = Cena.w.PLN / Przebieg.w.km,
         PRzebieg.w.m = Przebieg.w.km/1.6) %>% head(4)

auta %>%
  filter(Rok.produkcji > 2005) %>%
  group_by(Marka, Rok.produkcji) %>%
  summarise(srCena = mean(Cena.w.PLN)) -> agregat

head(agregat)
library(tidyr)
spread(agregat, Rok.produkcji, srCena) -> szeroka

szeroka %>%
  gather(Rok, srednia_cena, -Marka)

