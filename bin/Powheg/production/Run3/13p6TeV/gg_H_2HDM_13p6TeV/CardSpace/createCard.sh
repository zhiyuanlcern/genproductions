#!/bin/bash
#65 70 75 80 85 90 95 100 105 110 115 120 125 130 135 140 160 180 200 250 300 350 400 450 500 600 700 800 900 1000 1100 1200 1400 1600 1800 2000 2300 2600 2900 3200 3500
# higgs=3 ## 1 : h 2 : H 3 : A
alternative=0 ## 0: using hdamp for t loop or b loop or tb loop with small difference, 1:using alternative hdamp scales for tb loop
for loop in "t" "b" "tb" ; 
do
    for mass in 100 ;
    do
        for higgs in  1 3;
        do
            for hfactmode in 0 1 2;
            do
                if (( $(echo $mass'<'145 | bc -l) )); 
                then 
                    width=0.0041
                elif (( $(echo $mass'<'605 | bc -l) )); then 
                    width=0.1
                elif (( $(echo $mass'<'2005 | bc -l) )); then
                    width=1.0
                else
                    width=2.0
                fi
            
    #setup.sh  1: mass   2: channel: incl, t, b or tb # Combinations are (contrib-scale): incl-t/b/tb, t-t, b-b, tb-tb, t-tb, b-tb (!!!now t only)  3. width depending on mass  4.hfactmode
                # ./setup.sh $mass t $width $hdampmode $hfactmode; 
                ./setup.sh $mass $loop $width $hfactmode $higgs $alternative
            done;
        done;
    done;
done;