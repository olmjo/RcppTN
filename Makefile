build : clean
	R CMD build pkg
	R CMD Rd2pdf pkg
	tar -xvf RcppTN_*	

check :
	R CMD CHECK pkg

install :
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

bigtest : install
	Rscript ./pkg/inst/bigtest.R
	Rscript ./pkg/inst/comparison.R

.PHONEY : clean bigtest


