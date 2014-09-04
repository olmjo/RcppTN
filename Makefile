## Input Files
VIGN_RNW := $(wildcard ./pkg/vignettes/*.Rnw)
VIGN_TEX := $(patsubst ./pkg/vignettes/%.Rnw, ./pkg/vignettes/%.tex, ${VIGN_RNW})
VIGN_PDF := $(patsubst ./pkg/vignettes/%.Rnw, ./pkg/vignettes/%.pdf, ${VIGN_RNW})
VIGN_R := $(patsubst ./pkg/vignettes/%.Rnw, ./pkg/vignettes/%.R, ${VIGN_RNW})

default : rdocs install

attrs :
	# cd pkg ; Rscript -e "library(Rcpp) ; compileAttributes(verbose=TRUE)"

build : attrs rdocs vigns clean
	R CMD build pkg
	R CMD Rd2pdf pkg
	tar -xvf RcppTN_*

check : build
	R CMD check RcppTN_*
	R CMD check --as-cran RcppTN_*

fullinstall : build
	R CMD INSTALL RcppTN*.tar.gz

install : attrs clean
	R CMD INSTALL pkg

rdocs :
	./make_rdocs.R

remove :
	R CMD REMOVE RcppTN

test : attrs
	cd pkg/tests ; Rscript test-all.R

## Vignette Stuff
vigns : $(VIGN_TEX) $(VIGN_R) $(VIGN_PDF)
	rm -f $(VIGN_TEX) $(VIGN_R)

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
	rm -fr pkg.Rcheck
	rm -f ./pkg/src/*.o
	rm -f ./pkg/src/*.so
	rm -f ./pkg/src/*.rds
	rm -f ./pkg/inst/lib/*
	rm -f ./pkg.pdf
	rm -Rf ./RcppTN/
	## rm -Rf pkg/vignettes/figure
	rm -f pkg/vignettes/*aux
	rm -f pkg/vignettes/*tex
	rm -f pkg/vignettes/*log
	rm -f pkg/vignettes/*out
