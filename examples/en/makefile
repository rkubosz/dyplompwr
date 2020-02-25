TEX=latexmk
TEXFLAGS=-pdflua

.PHONY: all clean

all: main.pdf

main.pdf: main.tex
	$(TEX) $(TEXFLAGS) $<

clean:
	$(TEX) -c

cleanall:
	$(TEX) -C
