#! /bin/bash
for i in {1..8}; do
    echo "Testing input.$i"
    ../project < "input.$i" &> "output.$i"
done
