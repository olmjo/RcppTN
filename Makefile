## Input Files
VIGN_RNW := $(wildcard ./pkg/vignettes/*.Rnw)
VIGN_TEX := $(patsubst ./pkg/vignettes/%.Rnw, ./pkg/vignettes/%.tex, ${VIGN_RNW})
VIGN_PDF := $(patsubst ./pkg/vignettes/%.Rnw, ./pkg/vignettes/%.pdf, ${VIGN_RNW})
VIGN_R := $(patsubst ./pkg/vignettes/%.Rnw, ./pkg/vignettes/%.R, ${VIGN_RNW})

build : vigns clean
	R CMD build pkg
	R CMD Rd2pdf pkg
	tar -xvf RcppTN_*

check : vigns clean
	R CMD check pkg

fullinstall : build
	R CMD INSTALL RcppTN*.tar.gz

install : clean
	R CMD INSTALL pkg

remove :
	R CMD REMOVE RcppTN

test :
	cd pkg/tests ; Rscript test-all.R

## Vignette Stuff
vigns : $(VIGN_TEX) $(VIGN_R) $(VIGN_PDF)

%.tex : %.Rnw
	cd $(dir $<) ; Rscript -e "library(knitr) ; knit('$(notdir $<)')"

%.R : %.Rnw
	cd $(dir $<) ; Rscript -e "library(knitr) ; purl('$(notdir $<)')"

%.pdf : %.tex
	cd $(dir $<) ; pdflatex $(notdir $<)
## 

clean :
	rm -f RcppTN*.tar.gz
	rm -fr pkg.Rcheck
	rm -f ./pkg/src/*.o
	rm -f ./pkg/src/*.so
	rm -f ./pkg/src/*.rds
	rm -f ./pkg/inst/lib/*
	rm -f ./pkg.pdf
	rm -Rf ./RcppTN/
	rm -Rf pkg/vignettes/figure
	rm -f pkg/vignettes/*aux
	rm -f pkg/vignettes/*log
	rm -f pkg/vignettes/*out
