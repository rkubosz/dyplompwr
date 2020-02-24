TEX=latexmk
TEXFLAGS=-pdflua

.PHONY: all clean

all: pl.pdf

pl.pdf: pl.tex
	$(TEX) $(TEXFLAGS) $<

clean:
	$(TEX) -c

cleanall:
	$(TEX) -C
