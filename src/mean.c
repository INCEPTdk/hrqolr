#include <R.h>
#include <Rinternals.h>
#include "hrqolr.h"

SEXP mean(SEXP x)
{
	size_t n = length(x);

	double *px;
	px = REAL(x);

	double *res = (double *) R_alloc(1, sizeof(double));
	res[0] = 0.0;

	for (int i = 0; i < n; i++) {
		res[0] += px[i];
	}

	res[0] /= n;

	return ScalarReal(*res);
}
