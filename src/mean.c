#include <R.h>
#include <Rinternals.h>

SEXP C_Mean(SEXP x)
{
	size_t n = length(x);

	double *px;
	px = REAL(x);

	SEXP res = PROTECT(allocVector(REALSXP, 1));
	double *_res;
	_res = REAL(res);
	_res[0] = 0.0;

	for (int i = 0; i < n; i++) {
		_res[0] += px[i];
	}

	_res[0] /= n;

	UNPROTECT(1);

	return res;
}
