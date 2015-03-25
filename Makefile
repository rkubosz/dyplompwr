all:	README.html example.pdf archive

README.ltx:	README.tex
	./vc

README.html:	README.tex readme.tex README.ltx Makefile
	xhlatex README.tex "xhtml,fn-in,charset=utf-8" " -cunihtf -utf8"

example.pdf:	example.tex dyplom.cls dyplom.bst biblioex.bib readme.tex
	latexmk --pdf example

archive:	dyplom.zip

dyplom.zip: Makefile example1.tex  example.tex  oswiadczenie.tex  readme.tex  README.tex  win.tex biblioex.bib dyplom.cls example1.pdf  example.pdf  kotek.pdf  README.pdf README.html README.css dyplom.bst biblioex.bib README.ltx pwrdtyt_ramka.sty  pwrdtyt.sty  pwrptyt.sty  pwrrtyt.sty
	zip dyplom.zip Makefile example1.tex  example.tex  oswiadczenie.tex  readme.tex  README.tex  win.tex biblioex.bib dyplom.cls example1.pdf  example.pdf  kotek.pdf  README.pdf README.html README.css dyplom.bst biblioex.bib README.ltx pwrdtyt_ramka.sty  pwrdtyt.sty  pwrptyt.sty  pwrrtyt.sty

