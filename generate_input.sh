#! /bin/bash


for i in {500..2000}; do
    echo "Generating input.$i: "
    java Generator > "input.$i"
done
