#include <Rcpp.h>
#include <vector>

// [[Rcpp::plugins(cpp11)]]

//' Area under the curve
//'
//' @param x,y numeric vectors of coordinates
//' @return Area under the curve as a scalar.
//'
//' @export
// [[Rcpp::export]]
Rcpp::NumericVector fast_auc (
	Rcpp::NumericVector x,
	Rcpp::NumericVector y
) {

	// "Derived" values from input parameters
	// int N = x.length();

	// double rectangles;
	// double triangles;
	//
	// for (int i = 1; i < N; i++) {
	//
	// }
	//
	// dy <- y[-1] - y[-n]
	// dx <- x[-1] - x[-n]
	//
	// sum(
	// 	dx * y[-n], # rectangles
	// 	dx * dy * 0.5 # triangles
	// )
	//
	// return Rcpp::wrap(boot_results); // Rcpp::wrap() converts std::vector to appropriate Rcpp return type

	return 0;
}
