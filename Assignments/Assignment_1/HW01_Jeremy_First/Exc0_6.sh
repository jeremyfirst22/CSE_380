#!/bin/bash
## Jeremy First
## 22 October 2015


if [[ -z $1 || -z $2 ]] ; then 
    clear
    echo "Program will convert from Farenheit to Celcius and vice versa. "
    echo "Usage: $0 < temperature > < units ('F', 'C') > " 
    echo "Insufficient command line arguments. Entering interactive mode" 
    fi 

if [ -z $1 ] ; then 
    echo -n "Enter a temperature you wish to convert: " 
    read temp
else 
    temp=$1
    echo "Converting $temp degrees" 
fi 


originalUnits=$2
while [ -z $originalUnits ] ; do 
    echo -n "Enter the units of your input. 'F' for Farenheit and 'C' for Celcius: " 
    read userInput
    if [[ $userInput = 'F' || $userInput = 'C' ]] ; then 
        originalUnits=$userInput
    else 
        echo "Incorrect value entered for units" 
        fi 
    done 

if [ $originalUnits = 'F' ] ; then
    outTemp=$(echo "scale=3 ; ($temp -32) * 5/9" | bc) 
    echo $outTemp  
elif [ $originalUnits = 'C' ] ; then
    outTemp=$(echo "scale=3 ; $temp * 1.8 + 32" | bc) 
    echo $outTemp  
else 
    echo 
    echo "This program converts temperatures from Farenheit to Celcius, and vice versa." 
    echo 
    echo "Usage: $0 < temperature > < units (C,F) > " 
    echo 
    echo "Example: $0 100 C " 
    echo "     ## Outputs 292.0, the equivalent temperature in Farenheit. " 
    exit 
    fi  
