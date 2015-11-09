#!/bin/bash
## Jeremy First
## 22 October 2015

for i in {1..5} ; do 
    spaces=$((5-i)) 
    if [ $spaces != 0 ] ; then 
        for j in $(seq 1 $spaces) ; do
            printf " "  
            done 
        fi 
    for j in $(seq 1 $i) ; do 
        printf "$i " 
        done 
    printf "\n" 
    done 
for i in {1..5} ; do 
    spaces=$((5-i)) 
    if [ $spaces != 0 ] ; then 
        for j in $(seq 1 $spaces) ; do
            printf " "  
            done 
        fi 
    for j in $(seq 1 $i) ; do 
        printf ". " 
        done 
    printf "\n" 
    done 

exit 

