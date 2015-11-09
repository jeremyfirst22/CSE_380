## Jeremy First
## 22 October 2015 
## 
##Gnuplot parameters to plot the integration error of problem 1.1 vs the number 
## of discrete midpoints evaluated. 
## The plot is saved as 'error_vs_numPoints.png' 
## To produce the plot, use the command: gnuplot plot_errors.gnuplot 



set xrange [0:205] 
set xtic add ("10" 10) 
set xlabel 'Number of discrete points'
set ylabel 'Absolute error'
set logscale y
set format y "10^{%L}"

set grid xtic ytic

set linetype 1 lw 2 lc rgb "blue" pointtype 2 
set size square
plot 'errors.txt' u 1:5 w linesp t 'Integration error'

set output 'error_vs_numPoints.png' 
set term png 
set term png size 400,400
replot
