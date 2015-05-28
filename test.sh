#! /bin/bash
for i in {1..13}; do
    echo "Testing input.$i"
    rm tmp.txt -f
    ../project < "input.$i" &> tmp.txt
    diff tmp.txt "output.$i"
done

rm tmp.txt -f
