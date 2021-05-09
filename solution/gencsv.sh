#!/bin/bash
>inputdata
RANDOM=$$
for i in {0..9}
do 
 echo "$i", "$RANDOM" >> inputdata
done
