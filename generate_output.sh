#! /bin/bash
for i in {2001..2100}; do
    echo "Testing input.$i"
    ../project < "input.$i" &> "output.$i"
done
