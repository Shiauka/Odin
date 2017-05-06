day=$1
binpath=$2
path=$3
out=$4
para=$5

output_sk=$out/"$para".price
output_list=$path/"$para".list

mkdir -p $path/$para
python $binpath/twse_date.py $day | while read dayline; do
	echo "$dayline"
	wget -q -O $path/$para/"$dayline".csv.big5 "http://www.tse.com.tw/ch/trading/exchange/MI_INDEX/MI_INDEX.php?download=csv&qdate="$dayline"&selectType="$para
    iconv -f big5 -t utf-8 "$path/$para/"$dayline".csv.big5" -o "$path/$para/"$dayline".csv"
	rm "$path/$para/"$dayline".csv.big5"
done
ls -RD $path/$para > "$output_list"

#./bin/cvs2sk 0 $code $output_list $output_sk

#rm -rf $output_list

