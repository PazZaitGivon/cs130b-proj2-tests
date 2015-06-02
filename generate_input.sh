#! /bin/bash


for i in {2001..2100}; do
    echo "Generating input.$i: "
    java Generator > "input.$i"
done
