set xlabel 'N'
set ylabel 'Absolute error' 
set logscale y 
set yrange [0.01:2.1]

set grid xtic ytic 

set linetype 1 lw 2 lc rgb "blue" pointtype 2 
set size square 
plot 'errors.txt' u 1:3 w lines t "Absolute error"

set output "stirling_error.png"
set term png 
set term png size 400, 400
replot
