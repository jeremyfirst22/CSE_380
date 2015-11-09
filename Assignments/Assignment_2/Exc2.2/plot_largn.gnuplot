## Jeremy First
## 22 October 2015 
## 
##Gnuplot parameters to plot the CPU real time of problem 1.1 vs the number 
## of discrete midpoints evaluated. 
## The plot is saved as 'times_vs_numPoints.png' 
## To produce the plot, use the command: gnuplot plot_times.gnuplot 

set xrange [15000:5000000000] 
set xtic add ("10" 10) 
set xlabel 'Number of discrete points'
set ylabel 'Real CPU time (s) '
set format x "10^{%L}"
set format y "10^{%L}"
set logscale x
set logscale y 

set grid xtic ytic

set linetype 1 lw 2 lc rgb "blue" pointtype 2 
set size square
plot 'large-n.txt' w linesp t 'C++'

set output 'times_vs_largen.png' 
set term png 
set term png size 400,400
replot
