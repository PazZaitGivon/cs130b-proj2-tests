#! /bin/bash


for i in {28..500}; do
    echo "Generating input.$i: "
    java Generator > "input.$i"
done
