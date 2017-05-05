INFILE=$1
OS=$(uname -s)

echo "To calculate all files MD5 sum in the folder $INFILE"

if [ $OS == 'Darwin' ];
then
	  echo "Mac OS X"
		find $INFILE -type f -name "*.*" -exec md5 {} \;
else
		echo "Linux"
		find $INFILE -type f -name "*.*" -exec md5sum {} \;
fi
