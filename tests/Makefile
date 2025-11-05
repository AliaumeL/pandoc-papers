
paper.%.tex: paper.md
	pandoc --defaults=../pandoc-papers/defaults/$*.yaml -o $@ 

paper.%.pdf: paper.%.tex
	# latexmk 
	# TEXINPUTS append ../pandoc-papers/defaults/%/ 
	TEXINPUTS=.:../pandoc-papers/defaults/$*/: latexmk -pdf -halt-on-error -outdir=build $<
	cp build/$(notdir $@) $@


templates: paper.ieee.tex paper.lncs.tex paper.lipics.tex paper.plain.tex paper.acmart.tex

all: paper.ieee.pdf paper.lncs.pdf paper.lipics.pdf paper.plain.pdf paper.acmart.pdf

clean:
	rm -rf build paper.*.tex paper.*.pdf

.PHONY: clean all
