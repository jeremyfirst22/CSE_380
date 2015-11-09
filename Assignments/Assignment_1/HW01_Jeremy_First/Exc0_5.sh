#!/bin/bash
## Jeremy First
## 22 October 2015

## This is a frankenstein approach to handling rational numbers. 
##  1) Disassemble the number. 
##  2) Convert in parts
##  3) Reassemble number. 

Usage(){
    echo 
    echo "This program converts a number from decimal to hexidecimal" 
    echo 
    echo "Usage: $0 < number > " 
    echo 
    echo "Example: $0 -423 " 
    echo "     ## Outputs -1A7, the hexidecimal of -423. "
    echo 
    exit 
}

if [ -z $1 ] ; then Usage ; fi 

## Read input 
n=$1 

## Interpret input 
## Check if input is negative. Minus sign will be added back at end. 
if [[ $n =~ ^- ]] ; then 
    n=${n#*-}
    negative=True
fi 
## Add starting zero for rationals if missing ( .1 -> 0.1 ) 
if [[ $n =~ ^[.] ]] ; then 
    n=0${n}
    fi
## First check to see if number is rational or integer. 
afterDecimal=${n#*.} 
if [[ $n =~ ^[-]?[0-9]*[.][0-9]+$ ]] ; then 
    rational=True
    if [[ $afterDecimal =~ ^0 ]] ; then 
        ## Capture lead zeroes after the decimal
        leadZeroes=${afterDecimal%0*} 
        leadZeroes=0${leadZeroes} 
        ## if after decimal only lead zeros, don't count as rational number
        if [[ $afterDecimal =~ ^[0]+$ ]] ; then 
            rational=''
            fi 
        fi 
    n=${n%.*}
## If no digits follow decimal, get rid of decimal (handle input xxx. )  
else 
    n=${n%.*}
    fi 

## Check to make sure both inputs to convert() are numbers 
if [[ ! $afterDecimal =~ ^[0-9]*$ || ! $n =~ ^[0-9]*$ ]] ; then 
    echo "Error: Input must be a number! " 
    Usage
    fi 

## Convert
convert(){
    n=$1
    ## handle case 0, 0.0, x.0, 0.x, etc. 
    if [ $n -eq 0 ] ; then hexi=0 ; fi 
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
        hexi=${r}${hexi}
        n=$d
    done 
    echo $hexi
}

## First convert whatever is before the decimal 
m=$(convert $n) 

## Next add whatever was afte the decimal 
if [ $rational ] ; then 
    mafterDecimal=$(convert $afterDecimal) 
    m=${m}.${leadZeroes}${mafterDecimal}
    fi 

## finaly add a negative in front if original number was negative 
if [ $negative ] ; then 
    printf '-' 
    fi 

## Print hexidecial number
printf "$m\n" 

exit 
