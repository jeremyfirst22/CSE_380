#!/bin/bash
## Jeremy First
## 22 October 2015

##Initialize default value of number of points 
NP=10

Usage(){
    echo "Usage: $0 [options] " 
    exit 
}

HELP(){
    echo 
    echo "This program numerically integrates Cos(x) using the composite midpoint rule, "
    echo " and prints the definite integral and absolute error " 
    echo 
    echo "Usage: $0 [options] "
    echo "  -h   print this usage and exit " 
    echo "  -a   Set the minimum (xmin) of numerical integration      " 
    echo "  -b   Set the maximum (xmax) of numerical integration      " 
    echo "  -n   Number of discretized points for integration         : Default = 10" 
    echo 
    echo "Example: $0 -a 5 -b -n 100  "
    echo "      ## Numerically integrates Cos(x) from x=5 to x=10 over 100 steps" 
    echo 
    exit 
}
 
if [[ -z $1 || -z $2 ]] ; then 
    echo "Error: No min or max specified" 
    HELP
    fi 

### Parse command line options 
while getopts :a:b:n:h opt; do 
    case $opt in 
       a) 
        min=$OPTARG
        ;; 
       b) 
        max=$OPTARG
        ;; 
       n) 
        NP=$OPTARG
        ;; 
       :) 
        echo " option $OPTARG requires an argument! " 
        Usage
        ;; 
       h) 
        HELP
        ;; 
       \?)
        echo "Invalid option -$OPTARG " 
        HELP  
        ;;  
    esac 
    done 

## A few check to make sure input is corrct. 
if [[ -z $min || -z $max ]] ; then 
    echo "Invalid options" ; HELP
    fi 
if [ $min -gt $max ] ; then 
    echo "Error: Min must be less than max!" 
    exit 
    fi 
if [ $NP -le 0 ] ; then 
    echo "Error: Number of points must be larger than 0" 
    exit 
    fi 

### Begin computation 
h=$(echo "scale = 10 ; ($max - $min) / $NP " | bc) 

defInt=0; 
for i in $(seq 0 `expr $NP - 1`) ; do 
    minx=$(echo " $min + $h * $i " | bc)
    maxx=$(echo " $minx + $h " | bc) 
    mpApprox=$(scale=10 ; echo "$h * c($minx + $h / 2)" | bc -l) 
    defInt=$(scale=10 ; echo "$defInt + $mpApprox" | bc -l) 
    done 

analyticInt=$(echo "s($max) - s($min) " | bc -l)  
absError=$(echo "$defInt - $analyticInt " | bc -l) 
absError=${absError#-}


## Print definite integral and absolute error
printf "DefIntegral: $defInt AbsError: $absError \n" 

