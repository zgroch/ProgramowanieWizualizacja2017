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
* 2017-11-03 W: Projekt 1/2, L: [Lab](materialy/Lab05.Rmd)

### Programowanie w R

* 2017-11-10 W: [Tworzenie pakietów](https://pbiecek.gitbooks.io/przewodnik/content/Programowanie/pakiety/po_co.html), L: [Lab](https://raw.githubusercontent.com/pbiecek/ProgramowanieWizualizacja2017/master/materialy/Lab06.Rmd)
* 2017-11-17 *nie ma zajęć*
* 2017-11-24 W: Polimorficzność i klasy S3/S4 [rozdział 3.8](http://biecek.pl/R/), [adv-r](http://adv-r.had.co.nz/OO-essentials.html), [Wyk](https://raw.githubusercontent.com/pbiecek/ProgramowanieWizualizacja2017/master/materialy/Wyk07.Rmd) L:  [Lab](https://raw.githubusercontent.com/pbiecek/ProgramowanieWizualizacja2017/master/materialy/Lab07.Rmd)
* 2017-12-01 W: [Profilowanie](http://pbiecek.github.io/Przewodnik/Programowanie/pazury/profilowanie.html) i [debugowanie](http://pbiecek.github.io/Przewodnik/Programowanie/pazury/debugowanie.html) kodu, L: Projekt 2/1
* 2017-12-08 W: [Shiny](http://pbiecek.github.io/Przewodnik/Programowanie/jak_tworzyc_aplikajce.html), L:  [Lab](materialy/Lab08.Rmd)
* 2017-12-15 *nie ma zajęć*
* 2017-12-22 W: Projekt 2/2, L: 

### Wizualizacja

* 2017-01-12 W: Gramatyka grafiki A, L: 
* 2017-01-19 W: Gramatyka grafiki B, L: 
* 2018-01-26 W: Grafika interaktywna - rCharts, L: Projekt 3/1
* 2018-xx-xx W: Projekt 3/2, L: 


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

### Wyniki projektu 1:

Wszystkie zespoły wykonały ten projekt bardzo dobrze. 
Odejmowałem punkty za drobiazgi aby wskazać co jeszcze można poprawić. 
Jednak każdy z tych projektów był na naprawdę wysokim poziomie, stąd też punkty mieszczące się w przedziale 80-100

[docs](https://docs.google.com/spreadsheets/d/1CDcmFL9pnx1AivbdNO1gF012vMvBopSuyTUS-R9cvL0/edit?usp=sharing)

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

Celem projektu jest przygotowanie pakietu, realizującego określoną funkcjonalność, w tym przypadku definiowanie i rysowanie fraktala metodą IFS.

Drugi projekt realizujemy w zespołach. Zespoły muszą być inne niż w projekcie 1. 

W ramach tej fazy należy:

Przygotować pakiet, tworzący i rysujący system funkcji iterowanych (https://pl.wikipedia.org/wiki/IFS_(geometria_fraktalna), https://en.wikipedia.org/wiki/Iterated_function_system), czyli fraktale IFS. 

Pakiet powinien zawierać dwie funkcje:
* funkcja createIFS(), która przyjmuje pewną (w wersji min = 3, w wersji max - dowolną) listę funkcji (kontrakcji, ale to nie istotne). Można założyć, że funkcje, które ktoś poda jako argument będą przyjmowały jako argument werktor dwuelementowy i będą zwracały wektor dwuelementowy. Przykładowa funkcja:

```
kontrakcja1 <- function(x) {
	c(1 + x[1]/2, 1 + x[2]/2)
}
```

* funkcja createIFS() jako wynik powinna zwracać obiekt klasy S3 o nazwie IFS

* dla obiektów klasy IFS należy przygotować generyczną, przeciążoną funkcję plot(), która będzie rysowała złożenie funkcji do zadanej głębokości (np. = 8).


Pakiet każdego zespołu powinien nazywać się IFS______, gdzie ______ to dowolne wybrane przez zespół słowo, słowa lub liczba (jeżeli słowo, to musi być cenzuralne i najlepiej bez polskich znaczków). Każdy zespół musi mieć pakiet o innej nazwie.
Pakiet powinien być przygotowany zgodnie z regułami sztuki, funkcje i zbiory danych mają dokumentację, pakiet ma opis i zależności oraz unit testy. Funkcja test() i check() przechodzi bez błędów.
Do pakietu dołączony jest skrypt knitr ilustrujący wykonanie pakietu.

### Kryteria oceny projektu 2:

W tej fazie oceniane będą dwa kryteria:

A. Elastyczność pakietu.

Premiowane będą pakiety, których funkcja createIFS() zadziała na różnej liczby funkcji, które pozwolą na narysowanie różnych ciekawych fraktali.

Wersja przyzwoite minimum, to narysowanie trójkąta Sierpińskiego, wersja maximum to kilka interesujących fraktali.

B. Inżynierska jakość kodu.

Premiowane będą pakiety, których funkcje będą udokumentowane. Których zbiory danych będą udokumentowane. Który będzie posiadał odpowiednio dużo testów jednostkowych (testthat). Który będzie wyposażony w ilustracje (vigniette) pokazującą jak korzystać z funkcji pakietu.

*Uwaga* dla osób nie czujących sie zbyt pewnie z matematyką. Kontrakcji nie należy się bać bo to trudne słowo opisujące prosty byt. W razie jakicholwiek problemów dotyczących projektu proszę o kontakt.

Projekt 3
---------


