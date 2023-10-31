#include <R.h>
#include <Rinternals.h>

SEXP C_Bootstrap_mean_diffs(SEXP vals, SEXP grps, SEXP B, SEXP seed)
{
	// Mimic drand48
	#define srand48(seed) srand(seed)
	#define drand48() (rand()/(RAND_MAX + 1.0))
	srand48((unsigned) asInteger(seed));

	int n = length(vals);
	double *pvals = REAL(vals);
	int *pgrps = INTEGER(grps);

	SEXP boot_results = PROTECT(allocVector(REALSXP, asInteger(B)));
	double *pboot_results = REAL(boot_results);

	SEXP sums = PROTECT(allocVector(REALSXP, 2));
	double *psums = REAL(sums);

	SEXP ns = PROTECT(allocVector(INTSXP, 2));
	int *pns = INTEGER(ns);

	for (int b = 0; b < asInteger(B); b++) {
		psums[0] = 0.0; psums[1] = 0.0; // summed values in intv and ctrl, resp.
		pns[0] = 0; pns[1] = 0; // no. of values in intv and ctrl, resp.

		for (int i = 0; i < n; i++) {
			int idx = n * drand48();
			psums[pgrps[idx]] += pvals[idx];
			pns[pgrps[idx]] += 1.0;
		}

		pboot_results[b] = psums[0]/pns[0] - psums[1]/pns[1];
	}

	UNPROTECT(3);

	return boot_results;
}
