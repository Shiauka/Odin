code=$1
month=$2
binpath=$3
path=$4

mkdir -p $path/$code
python $binpath/month.py $month | while read monthline; do
	echo "$code : $monthline"
	wget -q -O $path/"$code"/"$monthline"_"$code".csv "http://www.twse.com.tw/ch/trading/exchange/STOCK_DAY/STOCK_DAY_print.php?genpage=genpage/Report"$monthline"/"$monthline"_F3_1_8_"$code".php&type=csv"
    iconv -f big5 -t utf-8 "$path/"$code"/"$monthline"_"$code".csv" -o "$path/"$code"/"$monthline"_"$code".csv"
done

