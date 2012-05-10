
all: final

.PHONY: dissertation clean ch-introduction ch-appendices
# Main ------------------------------------------------------------------------
final: 
	latexmk -pdf dissertation.tex

ch01:
	latexmk -pdf ch-introduction.tex

chAA:
	latexmk -pdf ch-appendices.tex

# Clean -----------------------------------------------------------------------
clean:
	git clean -f -X
