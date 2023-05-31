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

  var timings : [1..num_iters] real;

  for itr in 1..num_iters do {

    Initialize();

    var t0 : stopwatch;
    t0.start();

    for i in (Nt_start+1)..(Nt_start+Nt) {

      //var t0 : stopwatch;
      //t0.start();

      TimeStep();

      //DeAlias(q_hat);

      Diagnostics(i);

     //t0.stop();
     //writeln(t0.elapsed());
     //t0.clear();

    } // Timestepping loop

    timings[itr] = t0.elapsed();
    t0.clear();

} // iter

writeln(timings[1..]);
var time_mean = (+ reduce timings[1..]) / num_iters;
writeln(time_mean);

} // main
