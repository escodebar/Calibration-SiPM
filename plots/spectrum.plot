set terminal latex size 11cm, 9cm
set output 'spectrum.plot.tex'

set xlabel 'ADC Counts' rotate left
set ylabel 'Nr. Events'

set xrange [0:500]
set yrange [0:120]

set nokey

Landau(x, A, sig) = A * exp(- (x + exp(-x)) / (2.*sig))
Gauss(x,A,mu,sig) = A * exp(- (x-mu)**2 / (2.*sig)**2)

f(x) = Landau(x-100, 100, 20)

binwidth = 5
bin(x, width) = width * (floor(x/width) + 0.5)

set boxwidth binwidth

plot \
  f(bin(x, binwidth)) smooth freq with boxes, \
  f(x) with lines linestyle 1


