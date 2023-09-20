#include <algorithm>
#include <random>
#include <Rcpp.h>
#include <vector>

// [[Rcpp::plugins(cpp11)]]

//' Bootstrap mean differences
//'
//' @param vals numeric vector of values from observations
//' @param grps int vector with group assignments of the values in the `vals` parameter.
//' 	Assumes: 0 = actv, 1 = ctrl.
//' @param B int, the number of bootstrap samples (default = 2000)
//' @param fixed_seed int, seed to be used for pseudo-random number generation
//'
//' @return bootstrap samples of the mean difference by group assignment, as numeric vector.
//'
//' @export
// [[Rcpp::export]]
Rcpp::NumericVector bootstrap_mean_diffs (
	Rcpp::NumericVector vals,
	Rcpp::IntegerVector grps,
	int B = 2000,
	int fixed_seed = 4131
) {

	// "Derived" values from input parameters
	int N = vals.length();

	// Random engine
	// std::random_device rd;  // a seed source for the random number engine
	std::mt19937 gen(fixed_seed); // mersenne_twister_engine seeded with rd()
	std::uniform_int_distribution<> distrib(0, N-1);

	// Create bootstrap samples
	std::vector<double> boot_results(B);

	for (int b = 0; b < B; b++) {
		double sums[2] = {0.0, 0.0}; // summed values in actv and ctrl, resp.
		int ns[2] = {0, 0}; // no. of values in actv and ctrl, resp.

		for (int i = 0; i < N; i++) {
			int idx = distrib(gen);
			sums[grps[idx]] += vals[idx];
			ns[grps[idx]] += 1;
		}

		boot_results[b] = sums[0]/ns[0] - sums[1]/ns[1];
	}

	return Rcpp::wrap(boot_results); // Rcpp::wrap() converts std::vector to appropriate Rcpp return type
}
