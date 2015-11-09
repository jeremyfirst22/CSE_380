#!/bin/bash
## Jeremy First
## 22 October 2015

if [[ -z $1 || -z $2 || -z $3 ]] ; then 
    echo 
    echo "This program returns the largest of three supplied integers"
    echo 
    echo "Usage: $0 < integer 1 > < integer 2 > < integer 3 > " 
    echo 
    echo "Example: $0 5 3 8 " 
    echo "     ## Returns 8, the largest of the three integers." 
    echo 
    exit 
    fi 

if [[ $1 -gt $2 && $1 -gt $3 ]] ; then 
    max=$1 
elif [[ $2 -gt $3 && $2 -gt $1 ]] ; then 
    max=$2 
else max=$3
    fi 
echo $max 

exit 
