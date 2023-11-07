#include <R.h>
#include <Rinternals.h>

SEXP C_Bootstrap_mean_diffs(SEXP vals, SEXP grps, SEXP B)
{

	GetRNGstate(); // read in .Random.seed

	int n = length(vals);
	double *pvals;
	int *pgrps;
	pvals = REAL(vals);
	pgrps = INTEGER(grps);

	SEXP boot_estimates = PROTECT(allocVector(REALSXP, asInteger(B)));
	double *pboot_estimates;
	pboot_estimates = REAL(boot_estimates);

	double sums[2] = {0.0, 0.0}; // summed values in actv and ctrl, resp.
	int ns[2] = {0, 0}; // no. of values in actv and ctrl, resp.
	int idx = -1; // set to invalid index just in case

	for (int b = 0; b < asInteger(B); b++) {
		sums[0] = 0.0;
		sums[1] = 0.0;
		ns[0] = 0;
		ns[1] = 0;

		for (int i = 0; i < n; i++) {
			idx = R_unif_index(n);
			sums[pgrps[idx]] += pvals[idx];
			ns[pgrps[idx]] += 1;
		}

		pboot_estimates[b] = sums[0]/ns[0] - sums[1]/ns[1];
	}

	UNPROTECT(1);
	PutRNGstate(); // write out .Random.seed

	return boot_estimates;
}
