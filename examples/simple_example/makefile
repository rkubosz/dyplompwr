TEX=latexmk
TEXFLAGS=-pdflua

.PHONY: all clean

all: simple_example.pdf

simple_example.pdf: simple_example.tex
	$(TEX) $(TEXFLAGS) $<

clean:
	$(TEX) -c

cleanall:
	$(TEX) -C
