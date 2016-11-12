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
\newif\if@eng
\newif\if@pl

\@magistertrue
\@archiwumtrue
\@pltrue
\DeclareOption{archiwum}{\@archiwumtrue\@drukfalse}
\DeclareOption{druk}{\@druktrue\@archiwumfalse}
\DeclareOption{inzynier}{\@inzyniertrue\@magisterfalse}
\DeclareOption{magister}{\@magistertrue\@inzynierfalse}
\DeclareOption{english}{\@engtrue\@plfalse}
\DeclareOption{polski}{\@pltrue\@engfalse}
% Wszystkie opcje mają być przekazywane do klasy mwrep
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{mwrep}}
\ProcessOptions

%%=============================================================================
%%        Opcje dla druku
%%=============================================================================
\if@archiwum
    % Ładujemy klasę bazową, do opcji podanych w dokumencie dodajemy 12pt i openany
    % oraz doublesided
    \LoadClass[12pt,openany,twoside]{mwrep}
    \RequirePackage[a4paper,outer=2cm,inner=3.5cm,top=2.5cm,bottom=2.5cm]{geometry}
    % Interlinia jest ustawiana na 1		
    \RequirePackage[singlespacing]{setspace}
\fi

\if@druk
    % Ładujemy klasę bazową, do opcji podanych w dokumencie dodajemy 12pt
    \LoadClass[12pt]{mwrep}
    \RequirePackage[a4paper,top=2.5cm,left=3.5cm,right=2.5cm,bottom=2.5cm]{geometry}
    % Zmieniamy interlinię na 1.5 dla poprawienia przejrzystości
    \RequirePackage[onehalfspacing]{setspace}
\fi

%%=============================================================================
%%      Wymagane pakiety
%%=============================================================================
\RequirePackage{array,graphicx}
\RequirePackage[ddmmyyyy]{datetime}
\RequirePackage{lmodern}                % standardowy font, ładowany dla pewności
\RequirePackage[absolute]{textpos}	    % to na potrzeby strony tytułowej
\RequirePackage{xcolor} 				% na potrzeby strony tytułowej
\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax}

%%=============================================================================
%%		Opcje językowe na potrzeby strony tytułowej
%%=============================================================================
\if@pl
    \def\xd{Promotor: }
    \if@magister
        \def\pracadyplomowa{PRACA DYPLOMOWA}
    \fi
    \if@inzynier
        \def\pracadyplomowa{PRACA INŻYNIERSKA}
    \fi
    \def\logo{pwrlogo/pl.pdf}
\fi

\if@eng
    \def\xd{Supervisor: }
    \if@magister
        \def\pracadyplomowa{MASTER THESIS}    
    \fi
    \if@inzynier
        \def\pracadyplomowa{ENGINEER'S THESIS}
    \fi
    \def\logo{pwrlogo/en.pdf}
\fi
%%=============================================================================
%%		Strona tytułowa
%%=============================================================================
\def\promotor#1{\gdef\@promotor{#1}}
\def\miejscowosc#1{\gdef\@miejscowosc{#1}}
\def\dedykacja#1{\gdef\@dedykacja{#1}}
\def\@promotor{\@latex@error{No \noexpand\promotor given}\@ehc}
\def\wydzial#1{\gdef\@wydzial{#1}}
\def\kluczowe#1{\gdef\@kluczowe{#1}}
\def\@kluczowe{\@latex@error{No \noexpand\kluczowe given}\@ehc}
\def\streszczenie#1{\gdef\@streszczenie{#1}}
\def\@streszczenie{\@latex@error{No \noexpand\streszczenie given}\@ehc}
\def\titlen#1{\gdef\@titlen{#1}}
\def\@titlen{\@latex@error{No \noexpand\titlen given}\@ehc}

\renewcommand\maketitle{
    \begin{titlepage}
	\newgeometry{left=62.5mm,right=25mm,top=25mm,bottom=25mm}
	\pagenumbering{alph}
	\noindent\unitlength1mm
	\begin{picture}(0,0)
	\put(0,-25){\includegraphics[width=122mm]{\logo}}
	
	\if@pl
	    \put(60,-30){
	        \makebox(0,0)[cb]{
	            \fontsize{16pt}{18pt}\usefont{T1}{uop}{m}{n}{\@wydzial}}}
	\fi
	\if@eng
        \put(50,-30){
            \makebox(0,0)[cb]{
                \fontsize{14pt}{16pt}{\usefont{T1}{uop}{m}{n} \@wydzial}}}
    \fi
    
	\definecolor{jasnoszary}{rgb}{.74 .74 .74}
	\textcolor{jasnoszary}{
	    \put(0,-166){\rule{118mm}{4mm}}\put(0,-166){\rule{4mm}{80mm}}
	    \put(0,-90){\rule{118mm}{4mm}}\put(118,-166){\rule{4mm}{80mm}}
	}
	
	\put(61,-75){\makebox(0,0)[cb]{\fontsize{32pt}{34pt}\usefont{T1}{ugm}{m}{n} {\pracadyplomowa}}}
	
	\put(61,-95){\makebox(0,0)[t]{\parbox{115mm}{\onehalfspacing\centering\fontsize{16pt}{18pt}\usefont{T1}{ugm}{m}{n}  \@title \\ \@titlen}}}
	
	\put(61,-145){\makebox(0,0)[t]{\parbox{115mm}{\onehalfspacing\centering\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}\@author \\ \xd\@promotor}}}
		
	\put(122,-175){\makebox(0,0)[tr]{\parbox{115mm}{\onehalfspacing\fontsize{12pt}{14pt}\usefont{T1}{ugm}{m}{n}\raggedleft  \@kluczowe}}}
	
	\put(0,-200){\makebox(0,0)[tl]{\parbox{115mm}{\onehalfspacing\fontsize{10pt}{12pt}\usefont{T1}{ugm}{m}{n}\raggedright  \@streszczenie}}}
	
	\put(61,-250){\makebox(0,0){\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}
	{\@miejscowosc \  \the\year}}}
	\end{picture}
	
	\let\footnotesize\small
	\let\footnoterule\relax
	\let \footnote \thanks
	\mbox{}
	\cleardoublepage
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
  \global\let\@promotor\@empty
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
