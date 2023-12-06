#include <R.h>
#include <Rinternals.h>
#include <Rmath.h>
#include "hrqolr.h"

// Variance estimates using shifted data (to obtain single-pass logic), see:
// https://en.wikipedia.org/wiki/Algorithms_for_calculating_variance

SEXP welch_t_test(SEXP x, SEXP y, SEXP alpha)
{
	double _alpha = asReal(alpha);

	size_t nx = length(x);
	double *_x;
	_x = REAL(x);

	size_t ny = length(y);
	double *_y;
	_y = REAL(y);

	// Summary stats of x
	double mux = 0.0; // mean of x
	double Ex = 0.0; // expected value of x
	double Ex2 = 0.0; // expected value of x^2
	double Kx = _x[0]; // constant, must be within range of x

	for (int i = 0; i < nx; i++) {
		mux += _x[i] / nx;
		Ex += _x[i] - Kx;
		Ex2 += pow(_x[i] - Kx, 2);
	}
	double sex = sqrt((Ex2 - pow(Ex, 2)/nx) / (nx - 1) / nx); // std. error of x

	// Summary stats of y (logic identical that of x above)
	double muy = 0.0;
	double Ey = 0.0;
	double Ey2 = 0.0;
	double Ky = _y[0];

	for (int i = 0; i < ny; i++) {
		muy += _y[i] / ny;
		Ey += _y[i] - Ky;
		Ey2 += pow(_y[i] - Ky, 2);
	}
	double sey = sqrt((Ey2 - pow(Ey, 2)/ny) / (ny - 1) / ny);

	// Carry out actual null-hypothesis test
	double se = sqrt(pow(sex, 2) + pow(sey, 2));
	double degs_free = pow(se, 4) / (pow(sex, 4) / (nx - 1) + pow(sey, 4) / (ny - 1));
	double t_stat = (mux - muy) / se;

	double p_value = 2 * pt(-fabs(t_stat), degs_free, 1, 0);

	double conf_int[2];
	double q = qt(1.0 - _alpha * 0.5, degs_free, 1, 0);
	conf_int[0] = se * (t_stat - q);
	conf_int[1] = se * (t_stat + q);

	SEXP out = PROTECT(allocVector(REALSXP, 4));
	double *_out;
	_out = REAL(out);

	_out[0] = mux - muy;
	_out[1] = p_value;
	_out[2] = conf_int[0];
	_out[3] = conf_int[1];

	UNPROTECT(1);

	return out;
}
