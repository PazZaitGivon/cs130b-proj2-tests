#! /bin/bash


errorColor="\033[0;31m"
passColor="\033[0;36m"
noColor="\033[0;0m"
highlight="\033[03;31m"
nohighlight="\033[0;31m"

executable=project

if [ ! -x "../$executable" ] ; then
    echo -e "$errorColor Executable named $highlight../$executable$nohighlight could not be found! $noColor"
    exit -1
fi

for i in {1..27}; do
    printf "Testing input.$i: "
    rm -f tmp.txt
    actual=$(../$executable < "input.$i" 2> /dev/null )
    expected=$(tail -n 1 "output.$i")
    if [ "$actual" -ne "$expected" ] ; then
        printf "$errorColor"
        echo "fail! Expected $expected but found $actual"
    else
        printf "$passColor"
        echo pass
    fi
    printf "$noColor"
done

rm -f tmp.txt
