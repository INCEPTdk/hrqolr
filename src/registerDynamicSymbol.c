// To make R CMD check happy
// See https://github.com/RcppCore/Rcpp/issues/636#issuecomment-280985661

// RegisteringDynamic Symbols

#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

void R_init_hrqolr(DllInfo* info) {
	R_registerRoutines(info, NULL, NULL, NULL, NULL);
	R_useDynamicSymbols(info, TRUE);
}
