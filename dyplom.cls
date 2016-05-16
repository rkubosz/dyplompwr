\NeedsTeXFormat{LaTeX2e} % dla pełnej jasności
\ProvidesClass{dyplom} % jedyny niezbędny element klasy :-)
%% Opcje
% magister – strona tytułowa magisterska
% inzynier – strona tytułowa inzynierska
% archiwum – wersja do archiwum (wedlug zalecen ze strony)
% druk – wersja do druku (dla promotora)
\newif\if@archiwum
\newif\if@druk
\newif\if@inzynier
\newif\if@magister
\newif\if@ramka
\newif\if@eng
\newif\if@pl
\@inzyniertrue
\@archiwumtrue
\@ramkatrue
\@engfalse
\DeclareOption{archiwum}{\@archiwumtrue\@drukfalse}
\DeclareOption{druk}{\@druktrue\@archiwumfalse}
\DeclareOption{inzynier}{\@inzyniertrue\@magisterfalse}
\DeclareOption{magister}{\@magistertrue\@inzynierfalse}
\DeclareOption{ramka}{\@ramkatrue}
\DeclareOption{english}{\@engtrue\@plfalse}
\DeclareOption{polski}{\@pltrue\@engfalse}
% Wszystkie opcje mają być przekazywane do klasy mwrep
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{mwrep}} 
\ProcessOptions

%%=============================================================================
%%        Opcje dla druku
%%=============================================================================
%ustawienie marginesów
\RequirePackage[a4paper,left=35mm,right=25mm,top=25mm,bottom=25mm]{geometry}

\if@archiwum
% Ładujemy klasę bazową, do opcji podanych w dokumencie dodajemy 12pt i openany
% oraz doublesided
\LoadClass[12pt,openany,doublesided]{mwrep}
% Interlinia jest ustawiana na 1		
\linespread{1}
\fi

\if@druk
% Ładujemy klasę bazową, do opcji podanych w dokumencie dodajemy 12pt
\LoadClass[12pt]{mwrep}
% Zmieniamy interlinię na 1.5 dla poprawienia przejrzystości
\linespread{1.5}
\fi

%\RequirePackage[OT4]{fontenc}      	% odpowiednik \usepackage
%\RequirePackage[utf8]{inputenc} 		% to właściwie powinno być na zewnątrz

%%=============================================================================
%%      Wymagane pakiety
%%=============================================================================
\RequirePackage{fontspec}               % dla lualatex
\RequirePackage{array,graphicx}
\RequirePackage[toc]{appendix}
\RequirePackage[absolute]{textpos}	    % to na potrzeby strony tytułowej
\RequirePackage{xcolor} 				% na potrzeby strony tytułowej
\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax}


%\RequirePackage{tgtermes}

%%=============================================================================
%%		Opcje językowe
%%=============================================================================
% Pakiet babel wyłączony na potrzeby lualatex, który używa polyglossia.

\if@pl
\renewcommand{\appendixtocname}{Dodatki}
\renewcommand{\appendixpagename}{Dodatki}
%\usepackage[polish]{babel}
%\usepackage[OT4]{polski}
\usepackage{polyglossia}
\setdefaultlanguage{polish}
\fi

\if@eng
%\usepackage[main=english,polish]{babel}
\usepackage{polyglossia}
\setdefaultlanguage{english}
\setotherlanguages{polish}
\fi
%%=============================================================================
%%		Strona tytułowa
%%=============================================================================
\def\promotor#1{\gdef\@promotor{#1}}
\def\@promotor{\@latex@error{No \noexpand\promotor given}\@ehc}
\def\konsultant#1{\gdef\@konsultant{#1}}
%% Zakładam, że konsultanci nie będą występowali zbyt często.
%% Na kartę trafią tylko wtedy gdy będą...
\def\wydzial#1{\gdef\@wydzial{#1}}
\def\@wydzial{Wydział Chemiczny}
\def\kierunek#1{\gdef\@kierunek{#1}}
\gdef\@kierunek{@latex@error{No \noexpand\kierunek given}\@ehc}
\def\specjalnosc#1{\gdef\@specjalnosc{#1}}
\gdef\@specjalnosc{\@latex@warning@no@line{No \noexpand\specjalnosc given}}
\def\kluczowe#1{\gdef\@kluczowe{#1}}
\def\@kluczowe{\@latex@error{No \noexpand\kluczowe given}\@ehc}
\def\streszczenie#1{\gdef\@streszczenie{#1}}
\def\@streszczenie{\@latex@error{No \noexpand\streszczenie given}\@ehc}
\def\titlen#1{\gdef\@titlen{#1}}
\def\@titlen{\@latex@error{No \noexpand\titlen given}\@ehc}

% Czcionka Zapf użyta do nazwy wydziału
\newfontfamily\fontwydzial{ZapfHumnst BT}
\renewcommand\maketitle{
    \begin{titlepage}
	\newgeometry{left=62.5mm,right=25mm,top=25mm,bottom=25mm}
	\pagenumbering{alph}
	\noindent\unitlength1mm
	\begin{picture}(0,0)
	\put(0,-25){\includegraphics[width=128mm]{pwrlogo/pl1.eps}}
	
	\put(60,-30){\makebox(0,0)[cb]{\fontsize{16pt}{18pt}{\fontwydzial \@wydzial}}}
	%\put(64,-30){\makebox(0,0)[cb]{\fontsize{16pt}{18pt}\@wydzial}}
	
	\definecolor{jasnoszary}{rgb}{.74 .74 .74}
	\textcolor{jasnoszary}{
	    \put(0,-186){\rule{128mm}{4mm}}\put(0,-186){\rule{4mm}{80mm}}
	    \put(0,-110){\rule{128mm}{4mm}}\put(128,-186){\rule{4mm}{80mm}}
	}
	
	\put(64,-95){\makebox(0,0)[cb]{\fontsize{32pt}{34pt}\usefont{T1}{ugm}{m}{n} \textbf{PRACA          
	    DYPLOMOWA}}}
	
	\put(64,-115){\makebox(0,0)[t]{\parbox{115mm}{\centering\fontsize{16pt}{18pt}\usefont{T1}{ugm}{m}{n}\@title \\ \@titlen}}}
	
	\put(64,-175){\makebox(0,0){\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}\@author}}
	
	\put(128,-197){\makebox(0,0)[tr]{\parbox{115mm}{\fontsize{12pt}{14pt}\usefont{T1}{ugm}{m}{n}\raggedleft \@kluczowe}}}
	
	\put(0,-220){\makebox(0,0)[tl]{\parbox{115mm}{\fontsize{10pt}{12pt}\usefont{T1}{ugm}{m}{n}\raggedright \@streszczenie}}}
	\end{picture}
	
	\let\footnotesize\small
	\let\footnoterule\relax
	\let \footnote \thanks
	\mbox{}
\end{titlepage}


\restoregeometry
  \setcounter{footnote}{0}
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@titlen\@empty
  \global\let\@wydzial\@empty
  \global\let\@streszczenie\@empty
  \global\let\@kluczowe\@empty
  \global\let\@prommotor\@empty
  \global\let\title\relax
  \global\let\titlen\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\streszczenie\relax
  \global\let\wydzial\relax
  \global\let\kluczowe\relax
  \global\let\promotor\relax
  \pagenumbering{arabic}
}
\endinput
