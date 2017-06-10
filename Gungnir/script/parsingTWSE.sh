day=$1
binpath=$2
path=$3
out=$4
para=$5

output_sk=$out
output_list=$path/"$para".list


mkdir -p $path/$para
python $binpath/twse_date.py $day | while read dayline; do
	echo "$dayline"
	sample="http://www.twse.com.tw/exchangeReport/MI_INDEX?response=csv&date="$dayline"&type="$para
	#echo $sample
	wget -q -O $path/$para/"$dayline".csv.big5 $sample
    	iconv -f big5 -t utf-8 "$path/$para/"$dayline".csv.big5" -o "$path/$para/"$dayline".csv"
	rm "$path/$para/"$dayline".csv.big5"
done
ls -RD $path/$para > "$output_list"

./bin/cvs2sk 0 $output_list $output_sk

#rm -rf $output_list

