#include <R.h>
#include <Rinternals.h>

SEXP C_Create_xout(SEXP start, SEXP end, SEXP by)
{
	int _start = asInteger(start);
	int _end = asInteger(end);
	int _by = asInteger(by);
	int n = 2 + (_end - _start) / _by;

	if ((_start + (n - 2) * _by) == _end) {
		// _end == last value in out => nothing to append
		SEXP out = PROTECT(allocVector(INTSXP, n));
		int *pout;
		pout = INTEGER(out);

		pout[0] = 0;
		for (int i = 1; i < n; i++) {
			pout[i] = _start + (i - 1) * _by;
		}

		UNPROTECT(1);
		return out;
	} else {
		// _end != last value in out => append actual _end value
		SEXP out = PROTECT(allocVector(INTSXP, n + 1));
		int *pout;
		pout = INTEGER(out);

		pout[0] = 0;
		for (int i = 1; i < n; i++) {
			pout[i] = _start + (i - 1) * _by;
		}
		pout[n] = _end;

		UNPROTECT(1);
		return out;
	}
}
