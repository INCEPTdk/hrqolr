#include <R.h>
#include <Rinternals.h>

SEXP C_Auc(SEXP x, SEXP y)
{
	int n = length(x);
	double *px, *py;
	px = REAL(x);
	py = REAL(y);

	double *auc = (double *) R_alloc(1, sizeof(double));
	*auc = 0.0;

	for (int i = 1; i < n; i++) {
		*auc += (px[i] - px[i-1]) * (py[i] + py[i-1]) * 0.5;
	}

	return ScalarReal(*auc);
}
