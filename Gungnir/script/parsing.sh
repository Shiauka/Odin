#!/bin/bash

mode=$1
bin=$2
output=$3


if [ "$mode" = "earning_all" ];then
    cat codelist | while read code; do
	sh $bin/parsingTWYahoo.sh $code 2 $bin $output
	done
elif [ "$mode" = "dividend_all" ]; then
	cat codelist | while read code; do
	sh $bin/parsingTWYahoo.sh $code 1 $bin $output
	done
elif [ "$mode" = "price_all" ]; then
	cat codelist | while read code; do
	sh $bin/parsingTWSE.sh $code 10 $bin $output
	done
else
	echo "$mode is not implement"
fi

