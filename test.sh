#! /bin/bash


errorColor="\033[0;31m"
noColor="\033[0m"

for i in {1..13}; do
    echo "Testing input.$i"
    rm -f tmp.txt
    ../project < "input.$i" &> tmp.txt
    printf "$errorColor"
    diff tmp.txt "output.$i"
    printf "$noColor"
done

rm -f tmp.txt
