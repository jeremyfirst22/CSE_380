#!/bin/bash
## Jeremy First
## 22 October 2015

if [[ -z $1 || -z $2 ]] ; then 
    echo 
    echo "This program adds two integers together "
    echo 
    echo "Usage: $0 < integer 1 > < integer 2 > " 
    echo 
    echo "Example: $0 3 5 "
    echo "     ## Adds 3 and 5 together, and outputs 8. "
    echo 
    exit 
    fi 

int1=$1
int2=$2 

echo $((int1 + int2)) 

exit 
