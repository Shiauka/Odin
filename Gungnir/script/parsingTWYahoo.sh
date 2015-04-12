code=$1
mode=$2
bin=$3
output=$4
sk=$5

temp_html="$output"/temp_"$code".html
temp_xml="$output"/temp_"$code".xml
temp_utf8_xml="$output"/temp_"$code"_utf8.xml
output_cvs="$output"/"$code".cvs
output_sk="$sk"/"$code"

echo "$code"
#mode 1: dividend
#mode 2: earning
if [ "$mode" -eq 1 ];then
	wget -q -O $temp_html "https://tw.finance.yahoo.com/d/s/dividend_"$code".html"
	xml_mode=3;
elif [ "$mode" -eq 2 ];then
	wget -q -O $temp_html "https://tw.finance.yahoo.com/d/s/earning_"$code".html"
	xml_mode=2;
fi

./bin/html2xml $temp_html $temp_xml
iconv -f big5 -t utf-8 "$temp_xml" -o "$temp_utf8_xml"
./bin/xmlparser $xml_mode $temp_utf8_xml $output_cvs

if [ "$mode" -eq 1 ];then
./bin/cvs2sk 1 $code $output_cvs "$output_sk".dividend
elif [ "$mode" -eq 2 ];then
./bin/cvs2sk 2 $code $output_cvs "$output_sk".earning.month "$output_sk".earning.season
fi

rm $temp_xml $temp_html $temp_utf8_xml


