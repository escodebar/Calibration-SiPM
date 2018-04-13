set terminal latex size 11cm, 9cm
set output 'bahcall-senerelli.plot.tex'

set xlabel 'Neutrino Energy [$MeV$]' rotate left
set ylabel 'Flux [$cm^{-2}s^{-1}$]'

set xrange [0.1:11]
set yrange [0.1:10e12]

set nokey

set logscale xy

f(x) = 1/x
g(x) = 2/(2+x)
p(x,mu) = 10**11 * mu**int(x) / int(x)!*exp(-mu)

plot \
  f(x) title '1/x' with lines linestyle 1, \
  g(x) title '2/(2+x)' with lines linestyle 2, \
  p(x,4) title 'poisson' with lines linestyle 5


