inputpath=$1
filelist=$2
outputpath=$3


cat "$filelist" | while read filename; do
./bin/cvs2sk 3 $inputpath/$filename $outputpath
done

