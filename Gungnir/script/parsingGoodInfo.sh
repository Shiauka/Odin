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
fingrade="http://goodinfo.tw/StockInfo/StockFinGrade.asp?STOCK_ID="$code" -H Accept-Encoding: gzip, deflate, sdch -H Accept-Language: zh-TW,zh;q=0.8,en-US;q=0.6,en;q=0.4 -H Upgrade-Insecure-Requests: 1 -H User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36 -H Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8 -H Cache-Control: max-age=0 -H Cookie: ASPSESSIONIDQCDTTSBB=PJKLCFEDOFIJNGBIJKNKFAJK; ASPSESSIONIDQCBSQRDA=MJMNDEEDBHHLNIHOOHHGEGMP; ASPSESSIONIDQCBSRTBB=MMCJEFEDLPHNDKMPHNFEMNKJ; ASPSESSIONIDSCCQSSAB=MGLJFEEDBMMBBFNHKGODFMGJ; __gads=ID=a7a4fe276dd62a5f:T=1497271276:S=ALNI_MbfFQLzjzfSwws1fpav_im68fPouA; ASPSESSIONIDQADRQTAA=JHKLBGEDIFLNFANEKNMPMONI; ASPSESSIONIDQCCTSSBB=HBODIHEDONLPCOMLLHJBDCPE; ASPSESSIONIDSACTRQBA=JCELAHEDMIGIHBIANGNIGLHN; ASPSESSIONIDQCBRSTBB=LFNBLGEDGCHEJDAKAPNKCMPD; ASPSESSIONIDQAARQQCB=IBLBMFEDCJHFKLLANJALHCOD; ASPSESSIONIDQACQQSBB=KGEDKHEDGNKKLMNOIJLAIBNG; ASPSESSIONIDQCATQRCA=GAHBOFEDAGLMHLDMJAGNOEBL; _ga=GA1.2.468016550.1497271334; _gid=GA1.2.2078859278.1497271334; SCREEN_SIZE=WIDTH=1920^&HEIGHT=1080 -H Connection: keep-alive --compressed"
if [ "$mode" -eq 1 ];then
	#echo $fingrade
	curl -s -o $temp_html $fingrade
	xml_mode=11
fi

./bin/html2xml $temp_html $temp_xml
./bin/xmlparser $xml_mode $temp_xml $output_csv

#if [ "$mode" -eq 1 ];then
#./bin/cvs2sk 1 $code $output_cvs "$output_sk".dividend
#elif [ "$mode" -eq 2 ];then
#./bin/cvs2sk 2 $code $output_cvs "$output_sk".earning.month "$output_sk".earning.season
#fi

rm $temp_xml $temp_html
