build : clean
	R CMD build pkg
	R CMD Rd2pdf pkg
	tar -xvf RcppTN_*

vigns : 
	cd pkg/vignettes/; Rscript -e "library(knitr); knit('using.Rnw')"
	cd pkg/vignettes/; Rscript -e "library(knitr); purl('using.Rnw')"
	cd pkg/vignettes/; pdflatex using.tex
	cd pkg/vignettes/; Rscript -e "library(knitr); knit('speed.Rnw')"
	cd pkg/vignettes/; Rscript -e "library(knitr); purl('speed.Rnw')"
	cd pkg/vignettes/; pdflatex speed.tex

check : clean
	R CMD check pkg

smallcheck : clean
	R CMD check --no-vignettes pkg

fullinstall : clean build
	R CMD INSTALL RcppTN*.tar.gz

install : clean
	R CMD INSTALL pkg

remove :
	R CMD REMOVE RcppTN

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
	rm -f pkg/vignettes/*tex
