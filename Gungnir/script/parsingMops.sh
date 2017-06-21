code=$1
mode=$2
bin=$3
output=$4
sk=$5

temp_html="$output"/temp_"$code".html
temp_xml="$output"/temp_"$code".xml
temp_utf8_xml="$output"/temp_"$code"_utf8.xml
output_csv="$output"/"$code".csv
output_sk="$sk"/"$code"

echo "$code"
mops="http://mops.twse.com.tw/mops/web/ajax_t05st22?encodeURIComponent=1&run=Y&step=1&TYPEK=sii&year=&isnew=true&co_id="$code"&firstin=1&off=1&ifrs=Y"
#mops="http://mops.twse.com.tw/mops/web/t05st22_q1?encodeURIComponent=1&run=Y&step=1&TYPEK=sii&year=&isnew=true&co_id="$code"&firstin=1&off=1&ifrs=Y"
if [ "$mode" -eq 1 ];then
	#echo $mops
	wget -q -O $temp_html $mops
	xml_mode=21
fi

./bin/html2xml $temp_html $temp_xml
./bin/xmlparser $xml_mode $temp_xml $output_csv
./bin/cvs2sk 5 $code $output_csv "$output_sk".finreport

rm $temp_xml $temp_html
