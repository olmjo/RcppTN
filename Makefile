## Input Files
VIGN_RNW := $(wildcard ./vignettes/*.Rnw)
VIGN_TEX := $(patsubst ./vignettes/%.Rnw, ./vignettes/%.tex, ${VIGN_RNW})
VIGN_PDF := $(patsubst ./vignettes/%.Rnw, ./vignettes/%.pdf, ${VIGN_RNW})
VIGN_R := $(patsubst ./vignettes/%.Rnw, ./vignettes/%.R, ${VIGN_RNW})

default : install

attrs :
	#Rscript -e "library(Rcpp) ; compileAttributes(verbose=TRUE)"

build : attrs rdocs vigns clean
	R CMD build .
	R CMD Rd2pdf .
	tar -xvf RcppTN_*

check : build
	R CMD check RcppTN_*

crancheck :
	R CMD check --as-cran RcppTN_*

install : attrs rdocs vigns clean
	R CMD INSTALL .

fullinstall : build
	R CMD INSTALL RcppTN*.tar.gz

rdocs :
	./make_rdocs.R

remove :
	R CMD REMOVE RcppTN

test : attrs
	cd tests ; Rscript test-all.R

## Vignette Stuff
vigns : $(VIGN_TEX) $(VIGN_R) $(VIGN_PDF)
	## rm -f $(VIGN_TEX) $(VIGN_R)

vign_clean :
	rm -fr ./vignettes/cache
	rm -fr ./vignettes/figure
	rm -fr ./vignettes/*.pdf
	rm -fr ./vignettes/*.R
	rm -fr ./vignettes/*.tex

%.tex : %.Rnw
	cd $(dir $<) ; Rscript -e "library(knitr) ; knit('$(notdir $<)')"

%.R : %.Rnw
	cd $(dir $<) ; Rscript -e "library(knitr) ; purl('$(notdir $<)')"

%.pdf : %.tex
	cd $(dir $<) ; pdflatex $(notdir $<)
##

clean :
	rm -f RcppTN*.tar.gz
	rm -fr RcppTN.Rcheck
	rm -fr .Rcheck
	rm -f ./src/*.o
	rm -f ./src/*.so
	rm -f ./src/*.rds
	rm -f ./inst/lib/*
	rm -f ..pdf
	rm -Rf ./RcppTN/
	## rm -Rf pkg/vignettes/figure
	rm -f vignettes/*aux
	## rm -f pkg/vignettes/*tex
	rm -f vignettes/*log
	rm -f vignettes/*out
