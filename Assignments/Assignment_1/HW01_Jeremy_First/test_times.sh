#!/bin/bash
## Jeremy First
## 22 October 2015


## This is the script I used to test my run time performace to create the plots.
## times.txt was modified by hand to make real_times.txt to be easier to read into gnuplot. 
## outputs.txt was modified by hand to have n in front of each output, to be easier to read into gnuplot 

tests="10 50 100 200" 

rm -f errors.txt times.txt 
for i in $tests ; do 
    { time ./excercise_1.1.sh -a 0 -b 5 -n $i ; } >> outputs.txt 2>> times.txt 
    done 





