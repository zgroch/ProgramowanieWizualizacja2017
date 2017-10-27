# Programowanie i Wizualizacja danych z programem R

Z XKCD o jakości kodu.

![XKCD](http://imgs.xkcd.com/comics/code_quality.png)

Plan spotkań MIM UW:
----------------

### Praca z danymi

* 2017-10-06 W: Higiena pracy z R i RStudio, knitr, L: [Lab](materialy/Lab01.Rmd)
* 2017-10-13 W: Przetwarzanie potokowe, [dplyr, tidyr](https://pbiecek.gitbooks.io/przewodnik/content/Programowanie/czyscic_przetwarzac.html), L: [Lab](materialy/Lab02.Rmd)
* 2017-10-20 W: Instrukcje sterujące, pętle, funkcje, archivist [strona 80+](http://biecek.pl/R/PrzewodnikPoPakiecieRWydanieIVinternet.pdf), L: Projekt 1/1
* 2017-10-27 W: [Czytanie danych z baz danych, Internetu](https://pbiecek.gitbooks.io/przewodnik/content/Programowanie/jak_wczytac_tabele_danych_z_pliku_csv_lub_txt.html), L: [Lab](materialy/Lab04.Rmd)
* 2017-11-03 W: Projekt 1/2, L: 

### Programowanie w R

* 2017-11-10 W: Tworzenie pakietów, L: 
* 2017-11-17 W: Polimorficzność i klasy S3/S4, L: 
* 2017-11-24 W: Profilowanie i debugowanie kodu, L: Projekt 2/1
* 2017-12-01 W: Shiny, L: 
* 2017-12-08 W: Projekt 2/2, L: 

### Wizualizacja

* 2017-12-15 W: Gramatyka grafiki A, L: 
* 2017-12-22 W: Gramatyka grafiki B, L: 
* 2018-01-12 W: Grafika interaktywna - rCharts, L: Projekt 3/1
* 2018-01-19 W: Coś ciekawego, L: 
* 2018-01-26 W: Projekt 3/2, L: 


Materiały
---------

Zajęcia są oparte o materiały z książki *Przewodnik po pakiecie R* http://biecek.pl/R

Dosyć aktualna wersja elektroniczna znajduje się na stronie https://pbiecek.gitbooks.io/przewodnik/content/index.html

Projekt 1
---------

Celem projektu jest opracowanie raportu dotyczącego 15-latków z krajów biorących udział w badaniu PISA.

Raport powinien składać się ze strony tytułowej, spisu treści i 65 jednostronicowych podsumowań uczniów z różnych krajów (jedna strona na kraj).

Treść jednostronicowego podsumowania jest dowolna, może to być tabela, wykres, opis, lub zbiór tabel, wykresów i opisów.

Generowanie raportu powinno być całkowicie odtwarzalne. 

Dane dotyczące badania PISA 2012 znaleźć można tutaj: https://github.com/pbiecek/PISA2012lite

Krótki opis badania: https://pl.wikipedia.org/wiki/PISA_(badanie)

Kwestionariusz PISA: http://www.oecd.org/pisa/pisaproducts/PISA12_StQ_FORM_A_ENG.pdf


### Kryteria oceny projektu 1:

A. Modułowość kodu 

Dobre rozwiązanie powinno:

- składać się z funkcji,
- nazwy funkcji powinny wyjaśniać co funkcje robią,
- funkcje powinny być krótkie, max 1 ekran, idealnie 5-10 linii,
- funkcje nie powinny korzystać z globalnych parametrów, powinny przyjmować argumenty których potrzebują i jako wynik zwracać nowy stan zmiennych.

B. Elastyczność kodu

Dobre rozwiązanie powinno:

- dać się uruchomić na innym komputerze (moim),
- wyniki częściowe można pobrać (np. archivistem/zapisane w katalogu)
- powinno być łatwe w modyfikacji i rozszerzaniu (np. zadziałać dla mniejszego/większego zbioru danych).

C. Dopracowanie estetyczne i merytoryczne rozwiązania

Dobre rozwiązanie powinno:

- przedstawiać interesujące statystyki dla każdego kraju,
- przedstawiać ww. statystyki w sposób ciekawy i zwarty,
- strona tytułowa powinna zawierać informacje o autorach, temacie i problemie (najlepiej w języku angielskim),
- pozycje w spisie treści (spisie tabel/rysunków) powinny być działającymi linkami.


Projekt 2
---------



Projekt 3
---------


