if [ "$1" == "" ];
then
    echo "using by ./adv_rename_v.sh EXTENSION"
    exit;
fi

if [ "$1" == "srt" ];
then
	for file in $(find . -type f -name "*.$1"); 
	do
		filename=$file
		rename=$(echo $filename | sed 's/\.chs//g')
		
		if [ "$filename" != "$rename" ];then
			echo "New Name = $rename"
			mv $filename $rename
	
	 	fi
	done
elif [ "$1" == "mkv" ];
then
	for file in $(find . -type f -name "*.$1"); 
	do
		filename=$file
		rename=$(echo $filename | sed 's/\[hsaaaaaa-eyny\]//g')
		echo "filename = $filename"
		
		if [ "$filename" != "$rename" ];then
			echo "New Name = $rename"
			mv $filename $rename
	 	fi
	 done
else
	echo "Not supported extension type = $1"
fi