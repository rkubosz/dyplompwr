TEX=latexmk
TEXFLAGS=-pdflua

.PHONY: all clean

all: en.pdf

en.pdf: en.tex
	$(TEX) $(TEXFLAGS) $<

clean:
	$(TEX) -c

cleanall:
	$(TEX) -C
