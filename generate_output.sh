#! /bin/bash
for i in {1..2000}; do
    echo "Testing input.$i"
    ../project < "input.$i" &> "output.$i"
done
