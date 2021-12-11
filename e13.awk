#!/usr/bin/awk -f 
{ sum+=$1 }; END { print substr(sum, 0, 10) }
