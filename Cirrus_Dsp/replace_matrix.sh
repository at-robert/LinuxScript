if [ "$#" -lt 2 ]; then
	echo "Usage: cov.sh [in file] [out file]"
	exit -1
fi

DIR=$(dirname $2)
ENDSTR=$(cat $2 | grep '\#endif')
OSSTR=$(cat $2 | grep '\#define Bytes_of_os')
TVCS2_STR=$(cat $2 | grep '\#define Bytes_of_tv_cs2')

echo "The OS string = $OSSTR"
echo "The TVCS2 string = $TVCS2_STR"
echo "The end string = $ENDSTR"
echo "The folder name = $DIR"

#sed -ie  '/{/ ,/\};/d' $2 && sed -ie '/\#endif*/d' $2 && sed -n -e  '/{/ ,/\};/ p' $1 >> $2
sed -ie  '/{/ ,/\} ;/d' $2 && sed -ie '/\#define Bytes_of_tv_cs2*/d' $2  && sed -ie '/\#define Bytes_of_os*/d' $2 && sed -ie '/\#endif*/d' $2 && sed -n -e  '/{/ ,/\};/ p' $1 >> $2

echo $OSSTR >> $2
echo $TVCS2_STR >> $2
echo $ENDSTR >> $2
sed -ie '/^$/d' $2 && sed -ie 's/^[[:space:]]*//g' $2 && sed -ie 's/^[ \t]*//g' $2

find $DIR -type f -name "*.he" -exec rm {} \; 