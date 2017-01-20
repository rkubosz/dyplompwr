TEX=latexmk
TEXFLAGS=-lualatex

.PHONY: all clean

all: manual.pdf

manual.pdf: manual.tex
	$(TEX) $(TEXFLAGS) $<

clean:
	$(TEX) -c

cleanall:
	$(TEX) -C
