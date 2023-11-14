// See https://cran.r-project.org/doc/manuals/R-exts.html#Registering-native-routines

#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include "hrqolr.h"

static const R_CallMethodDef callEntries[] = {
	{"approx", (DL_FUNC) &approx, 7},
	{"auc", (DL_FUNC) &auc, 2},
	{"bootstrap_mean_diffs", (DL_FUNC) &bootstrap_mean_diffs, 3},
	{"create_xout", (DL_FUNC) &create_xout, 3},
	{"mean", (DL_FUNC) &mean, 1},
	{"welch_t_test", (DL_FUNC) &welch_t_test, 3},
	{NULL, NULL, 0}
};

void R_init_hrqolr(DllInfo* info) {
	R_registerRoutines(info, NULL, callEntries, NULL, NULL);
	R_useDynamicSymbols(info, TRUE);
}
