#include <R.h>
#include <Rinternals.h>

SEXP C_Create_xout(SEXP start, SEXP end, SEXP by)
{
	int _start = asInteger(start);
	int _end = asInteger(end);
	int _by = asInteger(by);
	int n = 2 + (_end - _start) / _by;

	if ((_start + (n - 2) * _by) == _end) {
		// _end == last value in res => nothing to append
		SEXP res = PROTECT(allocVector(INTSXP, n));
		int *_res;
		_res = INTEGER(res);

		_res[0] = 0;
		for (int i = 1; i < n; i++) {
			_res[i] = _start + (i - 1) * _by;
		}

		UNPROTECT(1);
		return res;
	} else {
		// _end != last value in out => append actual _end value
		SEXP res = PROTECT(allocVector(INTSXP, n + 1));
		int *_res;
		_res = INTEGER(res);

		_res[0] = 0;
		for (int i = 1; i < n; i++) {
			_res[i] = _start + (i - 1) * _by;
		}
		_res[n] = _end;

		UNPROTECT(1);
		return res;
	}
}
