# Makefile for paper with Markdown
#
# * Time-stamp: "2014-06-16 22:13:21 nomura"
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
TEXFILES=src/abstract.tex\
	src/intro.tex\
	src/manual.tex\
	src/architecture.tex\
	src/conclusion.tex
FIGFILES=figure/access.png\
	figure/architecture.eps\
	figure/home.png\
	figure/layouts.eps\
	figure/people.png\
	figure/people-sample.png\
	figure/program.png\
	figure/qrcode.png\
	figure/sessions.png\
	figure/session-sample.png
BIBFILES=biblist.bib
MD2TEX=cmd /c kramdown -o latex
CONVPUNC=sed -i -e 's/、/，/g' -e 's/。/．/g'
DVI2PDF=dvipdfmx -l
LATEX=uplatex -shell-escape
BIBTEX=upbibtex

.md.tex:
	$(MD2TEX) $< > $@
	if [ ! -s $@ ]; then rm -fv $@ && false; fi
	$(CONVPUNC) $@

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
