# latex Makefile
JOBNAME := EECS468_Project_Report_Wei_Tang

SRC := main

LATEX := pdflatex
BIBTEX := bibtex

JOBNAME ?= $(SRC)

FLAGS := -interaction=nonstopmode -halt-on-error -file-line-error
FLAGS += -jobname $(JOBNAME)

all:
	$(LATEX) $(FLAGS) $(SRC).tex
	$(BIBTEX) $(JOBNAME)
	$(LATEX) $(FLAGS) $(SRC).tex
	$(LATEX) $(FLAGS) $(SRC).tex

.PHONY: clean bibtex latex

latex:
	$(LATEX) $(FLAGS) $(SRC).tex

bibtex:
	$(BIBTEX) $(JOBNAME)

clean:
	-rm -rf *.blg *.out *.bbl *.aux *.log *.nav *.snm *.toc *.bib.bak $(JOBNAME).pdf
	-rm fig/*.pdf
