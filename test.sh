#!/bin/bash

OS=$(uname -s)

errorColor="\033[1;31m"
warningColor="\033[0;33m"
passColor="\033[0;36m"
noColor="\033[0;0m"
highlight="\033[03;31m"
nohighlight="\033[0;31m"

executable=project

if [ ! -x "../$executable" ] ; then
    echo -e "$errorColor Executable named $highlight../$executable$nohighlight could not be found! $noColor"
    exit -1
fi

passes=0
warnings=0
failures=0
for i in {1..2100}; do
    printf "Testing input.$i: "
    actual=$(../$executable < "input.$i" 2> /dev/null )
    actualerr=$(../$executable < "input.$i" 2>&1 > /dev/null)
    expected=$(tail -n 1 "output.$i")
    if [ "$OS" == "Linux" ] ; then
        expectederr=$(head -n -1 "output.$i")
    else
        expectederr=$(ghead -n -1 "output.$i")
    fi
    if [[ ! "$actual" =~ ^[\s]*-?[0-9]+[\s]*$ ]] || [[ ! "$expected" =~ ^[\s]*-?[0-9]+[\s]*$ ]] || [[  "$actual" -ne "$expected" ]] ; then
        printf "$errorColor"
        echo "fail! Expected \"$expected\" but found \"$actual\""
        failures=$((failures+1))
    elif [ ! "$actualerr" == "$expectederr" ] ; then
        printf "$warningColor"
        echo "warning: optimal solutions do not match, but this may be okay."
        warnings=$((warnings+1))
    else
        printf "$passColor"
        echo pass
        passes=$((passes+1))
    fi
    printf "$noColor"
done


echo "$passes passes, $warnings warnings, $failures failures."
