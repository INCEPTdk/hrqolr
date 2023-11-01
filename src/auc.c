#include <R.h>
#include <Rinternals.h>

SEXP C_Auc(SEXP x, SEXP y)
{
	int n = length(x);
	double *px = REAL(x);
	double *py = REAL(y);
	SEXP auc = PROTECT(allocVector(REALSXP, 1));
	double *pauc = REAL(auc);
	memset(pauc, 0.0, sizeof(double));

	for (int i = 1; i < n; i++) {
		pauc[0] += (px[i] - px[i-1]) * (py[i] + py[i-1]) * 0.5;
	}

	UNPROTECT(1);

	return auc;
}
