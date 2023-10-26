#include <R.h>
#include <Rinternals.h>

SEXP C_Mean(SEXP x)
{
	int n = length(x);
	double *px = REAL(x);

	SEXP sum = PROTECT(allocVector(REALSXP, 1));
	double *psum = REAL(sum);
	psum[0] = 0.0;
	for (int i = 0; i < n; i++) {
		psum[0] += px[i];
	}
	UNPROTECT(1);

	return ScalarReal(asReal(sum) / length(x));
}
