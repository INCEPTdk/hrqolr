#include <R.h>
#include <Rinternals.h>

SEXP C_Bootstrap_mean_diffs(SEXP vals, SEXP grps, SEXP B, SEXP seed)
{
	// Mimic drand48
	#define srand48(seed) srand(seed)
	#define drand48() (rand()/(RAND_MAX + 1.0))

	srand48((unsigned) asInteger(seed)); // set the seed

	int n = length(vals);
	double *pvals = REAL(vals);
	int *pgrps = INTEGER(grps);

	SEXP boot_estimates = PROTECT(allocVector(REALSXP, asInteger(B)));
	double *pboot_estimates = REAL(boot_estimates);

	double sums[2] = {0.0, 0.0}; // summed values in actv and ctrl, resp.
	int ns[2] = {0, 0}; // no. of values in actv and ctrl, resp.
	int idx = -1; // set to invalid index just in case

	for (int b = 0; b < asInteger(B); b++) {
		sums[0] = 0.0; sums[1] = 0.0;
		ns[0] = 0; ns[1] = 0;

		for (int i = 0; i < n; i++) {
			idx = n * drand48();
			sums[pgrps[idx]] += pvals[idx];
			ns[pgrps[idx]] += 1.0;
		}

		pboot_estimates[b] = sums[0]/ns[0] - sums[1]/ns[1];
	}

	UNPROTECT(1);

	return boot_estimates;
}
