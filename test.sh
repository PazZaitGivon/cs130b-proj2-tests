#! /bin/bash


errorColor="\033[0;31m"
noColor="\033[0m"

for i in {1..27}; do
    echo "Testing input.$i"
    rm -f tmp.txt
    actual=$(../project < "input.$i" 2> /dev/null )
    expected=$(tail -n 1 "output.$i")
    printf "$errorColor"
    if [ "$actual" -ne "$expected" ] ; then
        echo EROROROAJOWEJRAWEORJAWEJRALWJERLKAWJERLKJAWERLKJQWE
    fi
    printf "$noColor"
done

rm -f tmp.txt
