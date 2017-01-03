
if [ "$1" == "" ] ;
then
    echo "Default number 10"
    NUM=10
else
	NUM=$1
fi

if [ "$2" == "" ] ;
then
    echo "Default str"
else
	STR=$2
fi

mkdir $(printf "$STR%02i " $(seq 1 $NUM))