#ifndef hrqolr_h
#define hrqolr_h

#include <R.h>
#include <Rinternals.h>

SEXP approx(SEXP x, SEXP y, SEXP v, SEXP method, SEXP yleft, SEXP yright, SEXP sf);
SEXP auc(SEXP x, SEXP y);
SEXP bootstrap_mean_diffs(SEXP vals, SEXP grps, SEXP B);
SEXP create_xout(SEXP start, SEXP end, SEXP by);
SEXP mean(SEXP x);
SEXP welch_t_test(SEXP x, SEXP y, SEXP alpha);

#endif
