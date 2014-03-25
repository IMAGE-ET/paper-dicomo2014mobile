.SUFFIXES: .tex .md .pdf .bib .dvi .bib

TARGET=paper
TEXFILES=src/intro.tex\
	src/abstract.tex\
	src/eabstract.tex
FIGFILES=
BIBFILES=biblist.bib
MD2TEX=cmd /c kramdown -o latex
CONVPUNC=sed -i -e 's/、/，/g' -e 's/。/．/g'
DVI2PDF=dvipdfmx -l
LATEX=platex

.md.tex:
	$(MD2TEX) $< > $@
	if [ ! -s $@ ]; then rm -fv $@ && false; fi
	$(CONVPUNC) $@

all:\
	$(TARGET).pdf

clean:
	rm -vf src/*.tex
	rm -vf src/*.aux
	rm -vf *.aux
	rm -vf *.dvi
	rm -vf *.out
	rm -vf *.log
#	rm -v *.pdf

$(TARGET).pdf: $(TARGET).dvi
	$(DVI2PDF) -l $(TARGET)

$(TARGET).dvi:	$(TARGET).tex $(TEXFILES) $(FIGFILES) $(BIBFILES)
	$(LATEX) $(TARGET).tex
	$(LATEX) $(TARGET).tex
