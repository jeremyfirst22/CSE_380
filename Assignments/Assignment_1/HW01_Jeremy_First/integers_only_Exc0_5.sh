#!/bin/bash
## Jeremy First
## 22 October 2015

if [ -z $1 ] ; then 
    echo 
    echo "This program converts a number from decimal to hexidecimal" 
    echo 
    echo "Usage: $0 < number > " 
    echo 
    echo "Example: $0 -423 " 
    echo "     ## Outputs -1A7, the hexidecimal of -423. "
    echo 
    exit 
    fi 

n=$1 
if [ $n -lt 0 ] ; then 
    n=$((n * -1)) 
    negative=True
fi 
if [ $n -eq 0 ] ; then 
    m=0
    fi 

while [[ $n != 0 ]] ; do 
    d=$(echo "$n / 16" | bc) 
    r=$(echo "$n % 16" | bc) 
    if [ $r -gt 9 ] ; then 
        if [ $r -eq 10 ] ; then r='A' 
        elif [ $r -eq 11 ] ; then r='B' 
        elif [ $r -eq 12 ] ; then r='C' 
        elif [ $r -eq 13 ] ; then r='D' 
        elif [ $r -eq 14 ] ; then r='E' 
        elif [ $r -eq 15 ] ; then r='F' 
        fi 
    fi 
    m=$r$m
    n=$d
done 

if [ $negative ] ; then 
    printf '-' 
    fi 
printf "$m\n" 

exit 
