#include <R.h>
#include <Rinternals.h>
#include "hrqolr.h"

SEXP C_Auc(SEXP x, SEXP y)
{
	size_t n = length(x);

	double *px, *py;
	px = REAL(x);
	py = REAL(y);

	SEXP auc = PROTECT(allocVector(REALSXP, 1));
	double *_auc;
	_auc = REAL(auc);
	_auc[0] = 0.0;

	for (int i = 1; i < n; i++) {
		_auc[0] += (px[i] - px[i-1]) * (py[i] + py[i-1]) * 0.5;
	}

	UNPROTECT(1);

	return auc;
}
