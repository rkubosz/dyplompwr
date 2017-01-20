# Szablon dyplomu PWr

[For english readme click
here](https://github.com/rkubosz/dyplompwr/blob/master/docs/manual.pdf)

Ten projekt dostarcza nieoficjalny szablon pracy dyplomowej dla studentów
Politechniki Wrocławskiej. Ten szablon jest przeznaczony do zastosowania z
systemem składu tekstu [**LaTeX**](https://pl.wikipedia.org/wiki/LaTeX).

Szablon jest kompatybilny z [wymaganiami Wydziału
Chemicznego](http://www.wch.pwr.edu.pl/druki_dyplomanci,11.dhtml) odnośnie
formatowania i strony tytułowej.

Szablon tworzy stronę tytułową pracy magisterskiej lub inżynierskiej w wersji
polskiej lub angielskiej w formatowaniu wymaganym przez dziekanat lub w wersji
dla promotora.

## Cechy pakietu

__Dyplompwr__ zapewnia:
* tworzenie strony tytułowej;
* dopasowuje stronę tytułową do typu pracy: `master` dla pracy magisterskiej  i
  `engineer` dla pracy inżynierskiej;
* zmienia odpowiednio logo PWr i typ pracy do wybranego języka: `pl` dla języka
  polskiego i `en` dla angielskiego;
* z pomocą opcji `archive` i `twosided` dobiera odpowiednie marginesy, interlinię
  i skład dokumentu dla dziekanatu i promotora odpowiednio.


## Przykład użycia

Szablon należy załadować w pierwszej linijce pliku `.tex`:
```latex
\documentclass[master,archive,pl]{dyplompwr}
```
Użyte powyżej parametry spowodują utworzenie strony tytułowej po polsku dla
pracy magisterskiej oraz złożenie dokumentu przeznaczonego do druku
dwustronnego z interlinią i marginesami dla dziekanatu.

Strona tytułowa wymaga podania takich metadanych, jak nazwisko autora, tytuł
pracy, tytuł i nazwisko promotora etc. W tym celu należy je podać w dalszych
liniach pliku:
```latex
\documentclass[master,twosided,pl]{dyplompwr}
\author{imię i nazwisko autora pracy}
\title{tytuł polski}
\titlen{tytuł angielski}
\supervisor{tytuł, imię i nazwisko promotora}
\faculty{nazwa wydziału}
\city{Wrocław lub inna miejscowość}
\keywords{słowa kluczowe}
\abstract{Tutaj możesz napisać swoje krótkie streszczenie
pracy dyplomowej.}
```

Prosty przykład użycia klasy dyplompwr [jest zaprezentowany w tym
folderze.](https://github.com/rkubosz/dyplompwr/tree/master/examples/simple_example) 

## Instalacja
[**Dyplompwr** można pobrać bezpośrednio
tutaj.](https://github.com/rkubosz/dyplompwr/releases/download/v1.0/dyplompwr.zip)

Pobrany pakiet można zainstalować w sposób wybrany z poniższej listy:
* umieszczenie folderu `dyplompwr` w katalogu zawierajacym plik `.tex` pracy dyplomowej
* umieszczenie w katalogu:
    * Windows 7 i wyżej:  `C:\Users\twoja nazwa użytkownika\texmf\tex\latex\local\`
    * Linux:    `~/texmf/tex/latex/local/`
    * OSX:      `/Users/twoja nazwa użytkownika/Library/texmf/tex/latex/local/`


Użytkownicy Arch Linux mogą pobrać pakiet `dyplompwr` z repozytorium
[AUR](https://aur.archlinux.org/packages/dyplompwr/).

## Wymagania

W celu stworzenia ładnej i zgodnej z zaleceniami strony tytułowej należy
zainstalować dodatkowe fonty (URW Garamond i URW Classico), które domyślnie nie
są dostępne w dystrybucjach LaTeXa. 

Dokładna instrukcja instalacji tych fontów (po angielsku) znajduje się na
https://www.tug.org/fonts/getnonfreefonts/. Użytkownicy Arch Linux korzystający
z AUR powinni mieć te zależności automatycznie rozwiązane.
    
## Autorzy

Pakiet stworzyłem na podstawie wcześniej stworzonych pakietów autorstwa [dra
Andrzeja Giniewicza](https://github.com/aginiewicz/pwrmgr) oraz [dra Wojciecha
Myszki](https://kmim.wm.pwr.edu.pl/myszka/projekty/klasa-do-skladu-pracy-dyplomowej-magisterskiej-i-inzynierskiej-na-wydziale-mechanicznym-politechniki-wroclawskiej/).

## Licencja

Pakiet jest na licencji MIT.

