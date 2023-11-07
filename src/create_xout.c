#include <R.h>
#include <Rinternals.h>

SEXP C_Create_xout(SEXP start, SEXP end, SEXP by)
{
	int _start = asInteger(start);
	int _end = asInteger(end);
	int _by = asInteger(by);
	int n = 2 + (_end - _start) / _by;

	SEXP out = PROTECT(allocVector(INTSXP, n));
	int *pout;
	pout = INTEGER(out);

	pout[0] = 0;
	for (int i = 1; i < n; i++) {
		pout[i] = _start + (i - 1) * _by;
	}

	if ((_start + (n - 2) * _by) == _end) {
		// Nothing to append
		UNPROTECT(1);

		return out;
	} else {
		// Append the actual end value (it's different from end of the sequence)
		SEXP out2 = PROTECT(allocVector(INTSXP, n + 1));
		int *pout2;
		pout2 = INTEGER(out2);

		memcpy(pout2, pout, sizeof(int) * n);
		pout2[n] = _end;

		UNPROTECT(2);

		return out2;
	}
}
