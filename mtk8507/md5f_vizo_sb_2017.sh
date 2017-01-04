VER=$1
STM32FOLDER=~/GSync/Python/stm32_merge_bin
OUTPATH=~/stm32f105/FW/VIZIO_SB_2017/Combine_FW/$1

if [ "$1" == "" ];
then
    echo "using by ./md5f_vizio_sb_2017.sh VER"
    exit;
fi

./md5f_vizo_sb_3251.sh $VER
./md5f_vizo_sb_2820.sh $VER

echo "================================"
echo "To prepare combination bin of $OUTPATH ........"
echo "================================"

python $STM32FOLDER/stm32_merge_bin.py $STM32FOLDER

if [ -d $OUTPATH ];
then
		echo "================================"
		echo "$OUTPATH exists so that deleting it ........"
		echo "================================"
		rm -rf $OUTPATH
else
	echo "================================"
fi

mkdir $OUTPATH
cp -f $STM32FOLDER/OutputBinFile/fwupdate.bin $OUTPATH

echo "================================"
echo "Don't forget to make rar of $OUTPATH ........"
echo "================================"