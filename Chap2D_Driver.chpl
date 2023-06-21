use parameters;
use domains;
use arrays;
use Chap2D_Module;
use ARK43;
use IO_Module;
use AllLocalesBarriers;

//use compare_fortran;
use FFT_utils;
use Time;
use IO;

config const num_iters = 1;

proc main() {

  for itr in 1..num_iters do {

    Initialize();

    var t0 : stopwatch;
    t0.start();

    for i in (Nt_start+1)..(Nt_start+Nt) {

      TimeStep();

      Diagnostics(i);

    } // Timestepping loop

  } // iter

} // main
