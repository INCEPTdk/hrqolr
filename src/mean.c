#include <R.h>
#include <Rinternals.h>

SEXP C_Mean(SEXP x)
{
	int n = length(x);
	double *px;
	px = REAL(x);

	double *sum = (double *) R_alloc(1, sizeof(double));
	*sum = 0.0;
	for (int i = 0; i < n; i++) {
		*sum += px[i];
	}

	return ScalarReal(*sum / n);
}
