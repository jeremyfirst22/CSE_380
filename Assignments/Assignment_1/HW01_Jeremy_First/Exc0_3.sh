#!/bin/bash
## Jeremy First
## 22 October 2015

if [ -z $1 ] ; then 
    echo 
    echo "This programs returns the factorial of a supplied integer"
    echo 
    echo "Usage: $0 < integer > " 
    echo 
    echo "Example: $0 5 " 
    echo "     ## Returns the value 120, the factorial of 5"
    echo 
    exit 
    fi 

if [ $1 -gt 20 ] ; then 
    echo "Error: Factorial of larger than 20 results in overflow of expr" 
    exit ; fi 

factorial=1
for i in $(seq 1 $1) ; do 
    factorial=`expr $factorial \* $i` 
    done 

echo $factorial 
