#!/bin/bash
>inputFile
RANDOM=$$
for i in {0..9}
do 
 echo "$i", "$RANDOM" >> inputFile
done
