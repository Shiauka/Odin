#!/bin/bash

mode=$1
bin=$2
output=$3
analysis=$4

if [ "$mode" = "earning_all" ];then
    cat codelist | while read code; do
	sh $bin/parsingTWYahoo.sh $code 2 $bin $output $analysis
	done
elif [ "$mode" = "dividend_all" ]; then
	cat codelist | while read code; do
	sh $bin/parsingTWYahoo.sh $code 1 $bin $output $analysis
	done
elif [ "$mode" = "price_all" ]; then
	cat codelist | while read code; do
	sh $bin/parsingTWSE.sh $code 120 $bin $output $analysis
	done
else
	echo "$mode is not implement"
fi

