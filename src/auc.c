#include <R.h>
#include <Rinternals.h>
#include "hrqolr.h"

SEXP auc(SEXP x, SEXP y)
{
	size_t n = length(x);
	double *_x, *_y;
	_x = REAL(x);
	_y = REAL(y);

	double *auc = (double *) R_alloc(1, sizeof(double));
	auc[0] = 0.0;

	for (int i = 1; i < n; i++) {
		auc[0] += (_x[i] - _x[i-1]) * (_y[i] + _y[i-1]) * 0.5;
	}

	return ScalarReal(*auc);
}
