#include <Rcpp.h>
#include <vector>

// [[Rcpp::plugins(cpp11)]]

// ' Interpolate a single value
// '
// ' Essentially, a stripped-down version of approx.c from the stats package. Not meant to be called
// ' from R.
// '
// ' @param v double, x value where to interpolate
// ' @param x,y coordinates for known observationa
// ' @param n int, the length of x and y (they should have the same length but this is not checked)
// '
// ' @return Interpolated value
// ' @export
//'
double approx1(double v, std::vector<double> x, std::vector<double> y, int n) {
	// Find the correct interval by bisection
	int i, j, ij;
	i = 0;
	j = n - 1;

	while (i < (j - 1)) { /* x[i] <= v <= x[j] */
		ij = (i + j) / 2; /* i+1 <= ij <= j-1 */
		if (v < x[ij]) j = ij; else i = ij;
		/* still i < j */
	}
	// at this point: i == j-1

	if(v == x[j]) return y[j];
	if(v == x[i]) return y[i];

	return y[i] + (y[j] - y[i]) * ((v - x[i])/(x[j] - x[i]));
}


//' Interpolate multiple values
//'
//' User-facing, stripped-down version of approx.c from the stats package (which is around twice
//' as fast as this one).
//' Yields somewhere around 10x speed-up compared to using stats::approx().
//'
//' @param x,y coordinates for known observationa
//' @param xout vector or scalar with value(s) where interpolation should happen
//'
//' @return Interpolated values
//' @export
//'
// [[Rcpp::export]]
std::vector<double> linear_approx (
	std::vector<double> x,
	std::vector<double> y,
	std::vector<double> xout
) {

	int nx = x.size();
	int nout = xout.size();
	std::vector<double> yout(nout);

	for(int i = 0; i < nout; i++) {
		yout[i] = approx1(xout[i], x, y, nx);
	}

	return yout;
}
