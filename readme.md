# Szablon dyplomu PWr

Ten projekt dostarcza szablon pracy dyplomowej dla studentów Politechniki
Wrocławskiej. Ten szablon jest przeznaczony do zastosowania z systemem składu
tekstu [**LaTeX**](https://pl.wikipedia.org/wiki/LaTeX).

Szablon jest kompatybilny z [wymaganiami Wydziału
Chemicznego](http://www.wch.pwr.edu.pl/druki_dyplomanci,11.dhtml) odnośnie
formatowania i strony tytułowej.

Szablon tworzy stronę tytułową pracy magisterskiej lub inżynierskiej w wersji
polskiej lub angielskiej w formatowaniu wymaganym przez dziekanat lub w wersji
dla promotora.

## Przykład użycia

Szablon należy załadować w pierwszej linijce pliku .tex:
```latex
\usepackage[magister,archiwum,polski]{dyplompwr}
```
Użyte powyżej parametry spowodują utworzenie strony tytułowej po polsku dla
pracy magisterskiej oraz złożenie dokumentu przeznaczonego do druku
dwustronnego z interlinią i marginesami dla dziekanatu.

Strona tytułowa wymaga podania takich metadanych, jak nazwisko autora, tytuł
pracy, tytuł i nazwisko promotora etc. W tym celu należy je podać w dalszych
liniach pliku:
```latex
\documentclass[magister,druk,polski]{dyplom}
\author{imię i nazwisko autora pracy}
\title{tytuł polski}
\titlen{tytuł angielski}
\promotor{tytuł, imię i nazwisko promotora}
\wydzial{nazwa wydziału}
\miejscowosc{Wrocław lub inna miejscowość}
\kluczowe{słowa kluczowe}
\streszczenie{Tutaj możesz napisać swoje krótkie streszczenie
pracy dyplomowej.}
```

## Instalacja

Pakiet można zainstalować w sposób wybrany z poniższej listy:
* umieszczenie w katalogu zawierajacym plik .tex pracy dyplomowej
* umieszczenie w katalogu:
    * Windows:  C:\Users\<user name>\texmf\tex\latex\local\
    * Linux:    ~/texmf/tex/latex/local/
    * OSX:      /Users/<user name>/Library/texmf/tex/latex/local/

## Wymagania

W celu stworzenia ładnej i zgodnej z zaleceniami strony tytułowej należy
zainstalować dodatkowe czcionki, które domyślnie nie są dostępne w
dystrybucjach LaTeX-a. 

Dokładna instrukcja instalacji (po angielsku) znajduje się na
https://www.tug.org/fonts/getnonfreefonts/.
    
## Autorzy

Pakiet stworzyłem na podstawie wcześniej stworzonych pakietów autorstwa
[dra Andrzeja Giniewicza](https://github.com/aginiewicz/pwrmgr) oraz [dra
Wojciecha Myszki](https://kmim.wm.pwr.edu.pl/myszka/projekty/klasa-do-skladu-pracy-dyplomowej-magisterskiej-i-inzynierskiej-na-wydziale-mechanicznym-politechniki-wroclawskiej/).

