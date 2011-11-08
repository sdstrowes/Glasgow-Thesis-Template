
all: dissertation.pdf



INTRO_FILES=\
	./ch-introduction.tex					\
	./10-introduction/introduction.tex 		\
	./10-introduction/thesis_statement.tex

APPEN_FILES=./ch-appendices.tex   ./AA-appendix/appendix.tex

INPUTS=./header.tex			\
	./footer.tex			\
	./abstract.tex			\
	./acknowledgements.tex	\
	$(INTRO_FILES)			\
	./dissertation.tex


REGEX_CITE   = "LaTeX Warning: Citation.*undefined"
REGEX_LABL   = "LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right."
BLANK_LINE   = "================================================================================"


buildfunc = \
	@done_bibtex=0; \
	 do_tex=1; \
	 while [ $$do_tex = 1 ]; do \
	   echo $(BLANK_LINE); \
	   pdflatex -halt-on-error $(1).tex; \
	   if [ $$? = 1 ]; then \
	     exit; \
	   fi; \
	   undef_cite=`grep -c $(REGEX_CITE) $(1).log`; \
	   \
	   for f in `grep '\\\bibdata{' ${1}.aux | sed 's/\\\bibdata{//' | sed 's/}//'`; \
	   do \
	     if [ $$f.bib -nt ${1}.bbl ]; then \
	       do_bib=1; \
	     fi; \
	   done; \
	   \
	   do_tex=`grep -c $(REGEX_LABL) $(1).log`; \
	   \
	   if [ $$undef_cite != 0 ]; then \
	     if [ $$done_bibtex = 0 ]; then \
	       echo $(BLANK_LINE); \
	       bibtex ${1}; \
	       if [ $$? = 1 ]; then \
	         exit; \
	       fi; \
	       do_tex=1; \
	       done_bibtex=1; \
	     fi; \
	   fi; \
	 done; \
	 echo $(BLANK_LINE)


# Main ------------------------------------------------------------------------
dissertation.pdf: $(INPUTS) $(GRAPHICS) $(APPENDIX_PLOTS) glasgowthesis.cls
	$(call buildfunc,dissertation)

ch01: ch-introduction.pdf
chAA: ch-appendices.pdf

ch-introduction.pdf: header.tex footer.tex $(INTRO_FILES) $(GRAPHICS) glasgowthesis.cls
	$(call buildfunc,ch-introduction)

ch-appendices.pdf: header.tex footer.tex $(APPEN_FILES) $(GRAPHICS) $(APPENDIX_PLOTS) glasgowthesis.cls
	$(call buildfunc,ch-appendices)

# Clean -----------------------------------------------------------------------
clean:
	rm -f *.dvi *.log *.aux *.toc *.ps *.pdf *.bbl *.blg *.lof *.cb *.cb2 *.lot
