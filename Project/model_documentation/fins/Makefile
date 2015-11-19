DOCUMENT    := paper
MAIN_SOURCE := $(DOCUMENT).tex
BIB         := $(DOCUMENT).bib
LATEX       := TEXINPUTS=nasa_cls/:$$TEXINPUTS pdflatex
BIBTEX      := bibtex
EPSTOPDF    := epstopdf

#VPATH := .:$(HOME)/work/repos/bibliography

CHAPTERS    := $(wildcard chapters/*.tex)
APPENDICES  := $(wildcard appendices/*.tex)
#CHAPTERBIB  := $(patsubst %.tex, %.bbl, $(CHAPTERS))
#APPENDIXBIB := $(patsubst %.tex, %.bbl, $(APPENDICES))
CHAPTERBIB  := chapters/ablation.bbl chapters/compressible_navier_stokes.bbl chapters/solid_body_heat_conduction.bbl
APPENDIXBIB := appendices/compressible_navier_stokes-appendix.bbl
STYLES      := $(wildcard *.sty)
EPSFIGS     := $(wildcard figures/*/*.eps)
PDFFIGS     := $(wildcard figures/*/*.pdf)
FIGURES     := $(PDFFIGS)

%.pdf: %.eps
	$(EPSTOPDF) $<
%.bbl: %.tex
	$(BIBTEX) `dirname $@`/`basename $@ .bbl`

all:: pdffigs $(DOCUMENT) 

$(DOCUMENT): $(MAIN_SOURCE) $(CHAPTERS) $(APPENDICES) $(STYLES) $(BIB) $(FIGURES) Makefile
	$(LATEX) $<
	$(MAKE)	$(CHAPTERBIB)	
	$(MAKE)	$(APPENDIXBIB)	
	$(LATEX) $<
	$(LATEX) $<

.PHONY: all echo clean neat clobber pdffigs $(DOCUMENT)

pdffigs: $(FIGURES)

echo:
	@echo $(DOCUMENT) $(PREAM) $(MAIN_SOURCE)
	@echo $(CHAPTERS) $(APPENDICES) $(CHAPTERBIB) $(APPENDIXBIB)

clobber:: clean
	rm -f *~ *.dvi *.dvi.gz;                                       \
	if [ -f $(DOCUMENT).pdf ]; then                                \
	  rm -i $(DOCUMENT).pdf;                                       \
        fi

clean:: neat
	$(RM) ./chapters/*~ ./chapters/*.aux                             \
        $(RM) ./chapters/*.bbl ./chapters/*.blg                          \
	$(RM) ./appendices/*~ ./appendices/*.aux                         \
        $(RM) ./appendices/*.bbl ./appendices/*.blg                      \
	$(RM) *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky;           \
	$(RM) *.bbl *.blg *.lot *.brf;                                   \
	$(RM) *.cps *.fns *.kys *.tps *.vrs *.pgs *.kys                  \
	$(RM) *.auxO *.bblO *.cpO;                                       \
	$(RM) *.fnO *.tpO *.vrO *.pgO *.kyO *.lof _region_.tex .date;	 \
	$(RM) *.idx *.ilg *.ind *.gz~;					 \
	$(RM) *.toc.gz *.aux.gz *.log.gz *.cp.gz *.fn.gz;                \
	$(RM) *.tp.gz *.vr.gz *.pg.gz;                                   \
	$(RM) *.ky.gz *.bbl.gz *.blg.gz *.lot.gz;	                 \
	$(RM) *.cps.gz *.fns.gz *.kys.gz *.tps.gz;                       \
	$(RM) *.vrs.gz *.pgs.gz *.kys.gz;                                \
	$(RM) *.auxO.gz *.bblO.gz *.cpO.gz;				 \
	$(RM) *.fnO.gz *.tpO.gz *.vrO.gz *.pgO.gz *.kyO.gz *.lof.gz;	 \
	$(RM) _region_.tex.gz .date.gz;					 \
	$(RM) *.idx.gz *.ilg.gz *.ind.gz;	                         \
	$(RM) *.tex.bak *.tex.bak.gz;					 \
	$(RM) *.cb *.cb.gz                                               \
	$(RM) *.out

neat:: ;








