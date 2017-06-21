#!/bin/bash

mode=$1
bin=$2
output=$3
analysis=$4
codelist=$5


if [ "$mode" = "earning_all" ];then
    cat "$codelist" | while read code; do
	sh $bin/parsingTWYahoo.sh $code 2 $bin $output $analysis
	done
elif [ "$mode" = "dividend_all" ]; then
	cat "$codelist" | while read code; do
	sh $bin/parsingTWYahoo.sh $code 1 $bin $output $analysis
	done
elif [ "$mode" = "fingrade_all" ]; then
        cat "$codelist" | while read code; do
        sh $bin/parsingGoodInfo.sh $code 1 $bin $output $analysis
	sleep 15 #for goodinfo website limit
        done
elif [ "$mode" = "price_all" ]; then
	sh $bin/parsingTWSE.sh 10 $bin $output $analysis ALLBUT0999
elif [ "$mode" = "mops_all" ]; then
        cat "$codelist" | while read code; do
        sh $bin/parsingMops.sh $code 1 $bin $output $analysis
	sleep 4
        done
else
	echo "$mode is not implement"
fi

