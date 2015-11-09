#!/bin/bash
## Jeremy First
## 22 October 2015

numFiles=$(find $HOME -type f | wc -l) 
echo "There are $numFiles files in the home directory." 

numDirs=$(find $HOME -type d | wc -l) 
echo "There are $numDirs directories in the home directory" 

numExecFiles=$(find $HOME -type f -perm -a=x | wc -l) 
echo "Of the files, $numExecFiles are executable"

echo "These are the sizes of each directory in the home directory"
for direc in $(find $HOME -type d -maxdepth 1) ; do 
    du -sh $direc 
    done 

