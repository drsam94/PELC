#!/bin/bash

RETURN=0
function div {
    let RETURN=$[1000*$1/$2 | bc -l]
}

ORIGINAL=0
NUMERATOR=1
DENOMINATOR=1
for i in `seq 10 99`;
do
    for j in `seq $[$i+1] 99`
    do
        div $i $j
        let ORIGINAL=$RETURN
        if [ $[j / 10] -eq $[$i % 10] ]; then
            if [ $[$j % 10] -gt 0 ]; then
                div $[$i / 10] $[$j % 10]
                if [ $ORIGINAL -eq $RETURN ]; then
                    let NUMERATOR*=$i
                    let DENOMINATOR*=$j
                fi
            fi
        fi
    done
done

#This is obviously not generally how one finds the denominator
#of a lowest-terms fraction...but it is in this case, as the
#numerator is a factor of the denominator
echo $[$DENOMINATOR / $NUMERATOR]
