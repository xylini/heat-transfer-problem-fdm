#!/bin/bash
#PRECISE = 4
ifort -std08 -fpp -D"PRECISION=4" heat-equation-solution.f90 -o "hes4"

#PRECISE = 8
ifort -std08 -fpp -D"PRECISION=8" heat-equation-solution.f90 -o "hes8"

#PRECISE = 16
ifort -std08 -fpp -D"PRECISION=16" heat-equation-solution.f90 -o "hes16"

rm hes4.txt
touch hes4.txt

for i in `seq 1 1000`; do
    ./hes4 $i >> hes4.txt
done

rm hes8.txt
touch hes8.txt

for i in `seq 1 1000`; do
    ./hes8 $i >> hes8.txt
done

rm hes16.txt
touch hes16.txt

for i in `seq 1 1000`; do
    ./hes16 $i >> hes16.txt
done