

for file in $(find . -type f -name "*.mkv"); 
do
# 	filename=$(basename $file);
	filename=$file
#   	echo "Orginal Name = $filename"
	rename=$(echo $filename | sed 's/\[hsaaaaaa-eyny\]//g')
	
	if [ "$filename" != "$rename" ];then
		echo "New Name = $rename"
		mv $filename $rename
 		# Read input.
# 		echo "Please input r to rename files or exit"
# 		read input_char
# 
#   		# Check input char.
# 		if [ "$input_char" == "r" ]; then
#     		mv $filename $rename
# 		else
#     		echo "Don't rename anything"
#     		echo ""
#     		exit 1;
# 		fi 
 	fi
done