# Makefile for paper with Markdown
#
# * Time-stamp: "2014-07-17 19:22:07 nomura"
#
# requires:
# * Cygwin texlive packages
#     - texlive
#     - texlive-collection-basic
#     - texlive-collection-bibtexextra
#     - texlive-collection-langcjk
#     - texlive-collection-latex
#     - texlive-collection-latexextra
#     - texlive-collection-latexrecommended
#     - texlive-collection-pictures
# * Ruby gem
#     - kramdown

.SUFFIXES: .tex .md .pdf .bib .dvi .bib

TARGET=paper
MDFILES=$(wildcard src/*.md)
TEXFILES=$(MDFILES:.md=.tex)
FIGFILES=$(wildcard figure/*.eps)\
	$(wildcard figure/*.png)
BIBFILES=$(wildcard *.bib)
MD2TEX=cmd /c kramdown -o latex
PRECONV=sed -e 's/\[cite:\([^]]\+\)\]/{::nomarkdown}\\cite{\1}{:\/}/g'\
	-e 's/\[fig:\([^]]\+\)\]/{::nomarkdown}\\ref{fig:\1}{:\/}/g'\
	-e 's/\[table:\([^]]\+\)\]/{::nomarkdown}\\ref{table:\1}{:\/}/g'\
	-e 's/、/，/g' -e 's/。/．/g'
DVI2PDF=dvipdfmx -l
LATEX=uplatex -shell-escape
BIBTEX=upbibtex

.md.tex:
	$(PRECONV) $< | $(MD2TEX) > $@
	if [ ! -s $@ ]; then rm -fv $@ && false; fi

.dvi.pdf:
	$(DVI2PDF) $*

all:\
	$(TARGET).pdf

clean:
	rm -vf src/*.tex
	rm -vf src/*.aux
	rm -vf *.aux
	rm -vf *.dvi
	rm -vf *.out
	rm -vf *.log
	rm -vf *.bbl
#	rm -v *.pdf

$(TARGET).bbl: $(TARGET).tex $(BIBFILES) $(TEXFILES)
	rm -vf *.aux
	rm -vf src/*.aux
	rm -vf *.bbl
	$(LATEX) $(TARGET).tex
	$(BIBTEX) $(TARGET)

$(TARGET).dvi:	$(TARGET).tex $(TARGET).bbl $(TEXFILES) $(FIGFILES)
#$(TARGET).dvi:	$(TARGET).tex $(TEXFILES) $(FIGFILES)
	$(LATEX) $(TARGET).tex
	$(LATEX) $(TARGET).tex
