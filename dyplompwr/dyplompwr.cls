\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dyplompwr}
\newif\if@archive
\newif\if@twosided
\newif\if@engineer
\newif\if@master
\newif\if@eng
\newif\if@pl

\@mastertrue
\@archivetrue
\@pltrue
\DeclareOption{archive}{\@archivetrue\@twosidedfalse}
\DeclareOption{twosided}{\@twosidedtrue\@archivefalse}
\DeclareOption{engineer}{\@engineertrue\@masterfalse}
\DeclareOption{master}{\@mastertrue\@engineerfalse}
\DeclareOption{en}{\@engtrue\@plfalse}
\DeclareOption{pl}{\@pltrue\@engfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{mwrep}}
\ProcessOptions

%%        Opcje dla twosided
\if@archive
    % Ładujemy klasę bazową, do opcji podanych w dokumencie dodajemy 12pt i openany
    % oraz doublesided
    \LoadClass[12pt,openany,twoside]{mwrep}
    \RequirePackage[a4paper,outer=2cm,inner=3.5cm,top=2.5cm,bottom=2.5cm]{geometry}
    % Interlinia jest ustawiana na 1
    \RequirePackage[singlespacing]{setspace}
\fi

\if@twosided
    % Ładujemy klasę bazową, do opcji podanych w dokumencie dodajemy 12pt
    \LoadClass[12pt]{mwrep}
    \RequirePackage[a4paper,top=2.5cm,left=3.5cm,right=2.5cm,bottom=2.5cm]{geometry}
    % Zmieniamy interlinię na 1.5 dla poprawienia przejrzystości
    \RequirePackage[onehalfspacing]{setspace}
\fi

%%      Wymagane pakiety
\RequirePackage{array,graphicx}
\RequirePackage[ddmmyyyy]{datetime}
\RequirePackage{lmodern}                % standardowy font, ładowany dla pewności
\RequirePackage[absolute]{textpos}	    % to na potrzeby strony tytułowej
\RequirePackage{xcolor} 				% na potrzeby strony tytułowej
\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax}

%%		Opcje językowe na potrzeby strony tytułowej
\if@pl
    \def\xd{Promotor: }
    \if@master
        \def\thesisheader{PRACA DYPLOMOWA}
    \fi
    \if@engineer
        \def\thesisheader{PRACA INŻYNIERSKA}
    \fi
    \def\logo{logopwr/pl.pdf}
\fi

\if@eng
    \def\xd{Supervisor: }
    \if@master
        \def\thesisheader{MASTER THESIS}
    \fi
    \if@engineer
        \def\thesisheader{ENGINEER'S THESIS}
    \fi
    \def\logo{logopwr/en.pdf}
\fi

%%		Strona tytułowa
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\city#1{\gdef\@city{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
\def\@supervisor{\@latex@error{No \noexpand\supervisor given}\@ehc}
\def\faculty#1{\gdef\@faculty{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}
\def\abstract#1{\gdef\@abstract{#1}}
\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}
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
	            \fontsize{16pt}{18pt}\usefont{T1}{uop}{m}{n}{\@faculty}}}
	\fi
	\if@eng
        \put(50,-30){
            \makebox(0,0)[cb]{
                \fontsize{14pt}{16pt}{\usefont{T1}{uop}{m}{n} \@faculty}}}
    \fi
    
	\definecolor{lightgray}{rgb}{.74 .74 .74}
	\textcolor{lightgray}{
	    \put(0,-166){\rule{118mm}{4mm}}\put(0,-166){\rule{4mm}{80mm}}
	    \put(0,-90){\rule{118mm}{4mm}}\put(118,-166){\rule{4mm}{80mm}}
	}
	
    \put(61,-75){\makebox(0,0)[cb]{ \fontsize{32pt}{34pt} \usefont{T1}{ugm}{m}{n}{\thesisheader}}}
	
    \put(61,-95){\makebox(0,0)[t]{\parbox{115mm}{
        \onehalfspacing\centering\fontsize{16pt}{18pt}\usefont{T1}{ugm}{m}{n} \@title \\ \@titlen}}} 

    \put(61,-145){\makebox(0,0)[t]{\parbox{115mm}{\onehalfspacing
        \centering\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}\@author \\ \xd\@supervisor}}}
		
    \put(122,-175){\makebox(0,0)[tr]{\parbox{115mm}{
        \onehalfspacing\fontsize{12pt}{14pt}\usefont{T1}{ugm}{m}{n}\raggedleft \@keywords}}}
	
    \put(0,-200){\makebox(0,0)[tl]{\parbox{115mm}{\onehalfspacing
        \fontsize{10pt}{12pt}\usefont{T1}{ugm}{m}{n}\raggedright \@abstract}}}
	
	\put(61,-250){\makebox(0,0){\fontsize{14pt}{16pt}\usefont{T1}{ugm}{m}{n}{\@city \ \the\year}}}
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
  \global\let\@faculty\@empty
  \global\let\@abstract\@empty
  \global\let\@keywords\@empty
  \global\let\@supervisor\@empty
  \global\let\title\relax
  \global\let\titlen\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\abstract\relax
  \global\let\faculty\relax
  \global\let\keywords\relax
  \global\let\supervisor\relax
  \pagenumbering{arabic}
}
\endinput
