#include <R.h>
#include <Rinternals.h>

SEXP C_Create_xout(SEXP start, SEXP end, SEXP by)
{
	int start_ = asInteger(start);
	int end_ = asInteger(end);
	int by_ = asInteger(by);
	int n = 2 + (end_ - start_) / by_;

	SEXP out = PROTECT(allocVector(INTSXP, n));
	int *pout = INTEGER(out);

	pout[0] = 0;
	for (int i = 1; i < n; i++) {
		pout[i] = start_ + (i-1) * by_;
	}

	if ((start_ + (n - 2) * by_) == end_) {
		// Nothing to append
		UNPROTECT(1);

		return out;
	} else {
		// Append the actual end value (it's different from end of the sequence)
		SEXP out2 = PROTECT(allocVector(INTSXP, n + 1));
		int *pout2 = INTEGER(out2);

		memcpy(pout2, pout, sizeof(int) * n); // move pointer in one go
		pout2[n] = end_;

		UNPROTECT(2);

		return out2;
	}
}
