#!/bin/sh
s=1
while [ `clingo $1 -c s=$s | grep Answer | wc -l` -eq 0 ]
do
    s=`expr $s + 1`
done
clingo $1 -c s=$s