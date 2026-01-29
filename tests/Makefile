.PHONY: all templates clean

PANDOC=pandoc --data-dir=$(shell pwd)/../pandoc-papers

TEMPLATES=ieee lncs lipics plain acmart

TEXFILES = $(patsubst %,paper.%.tex,$(TEMPLATES))
PDFFILES = $(patsubst %,paper.%.pdf,$(TEMPLATES))

all: $(PDFFILES)

templates: $(TEXFILES)

paper.%.tex: paper.md
	$(PANDOC) --defaults=$* -o $@ --metadata-file=paper-meta.yaml paper.md

paper.%.pdf: paper.%.tex
	# latexmk 
	# TEXINPUTS append ../pandoc-papers/defaults/%/ 
	TEXINPUTS=.:../pandoc-papers/templates/$*/: latexmk -f -pdf -halt-on-error -outdir=build $<
	cp build/$(notdir $@) $@

clean:
	rm -rf build paper.*.tex paper.*.pdf
