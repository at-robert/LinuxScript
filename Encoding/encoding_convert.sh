
if [ "$1" == "" ] ;
then
    echo "using by ./test.sh FOLDER"
    exit;
fi

FOLDER=$1
OUT_FOLDER=/Volumes/Jet_drive/OUT_SRT
TMP_FOLDER=/Volumes/Jet_drive/TMP_SRT

if [ -d $OUT_FOLDER ];
then
		echo "================================"
		echo "$OUT_FOLDER exists so that deleting it ........"
		echo "================================"
		rm -rf $OUT_FOLDER
else
	echo "================================"
fi

mkdir $OUT_FOLDER


if [ -d $TMP_FOLDER ];
then
		echo "================================"
		echo "$OUT_FOLDER exists so that deleting it ........"
		echo "================================"
		rm -rf $TMP_FOLDER
else
	echo "================================"
fi

mkdir $TMP_FOLDER


for file in $(find $FOLDER -type f -name "*.srt"); 
do
	echo $(file -I $file)
done

for file in $(find $FOLDER -type f -name "*.srt"); 
do
	filename=$(basename $file);
	if (file -I $file | grep -wq "utf-16be") || (file -I $file | grep -wq "utf-16le") || (file -I $file | grep -wq "utf-16")
  	then
  		echo "== $filename ==="
    	iconv -f utf-16 -t utf-8 "$file" > "$OUT_FOLDER/$filename";
    #else
    	#echo "== $filename isn't utf-16 ==="
    fi
    if (file -I $file | grep -wq "utf-8")
  	then
  		echo "== $filename ==="
    	iconv -f utf-8 -t utf-16 "$file" > "$TMP_FOLDER/$filename";
    	iconv -f utf-16 -t utf-8 "$TMP_FOLDER/$filename" > "$OUT_FOLDER/$filename";
    #else
    	#echo "== $filename isn't utf-8 ==="
    fi
    if (file -I $file | grep -wq "iso-8859-1")
  	then
  		echo "== $filename ==="
    	iconv -f ISO-8859-1 -t utf-8 "$file" > "$OUT_FOLDER/$filename";
    #else
    	#echo "== $filename isn't iso-8859-1 ==="
    fi
done



rm -rf $TMP_FOLDER