VER=$1
INPATH=/Volumes/robert.lo/STM32/Haier_29_35/Projects/15_Haier/EWARM/Projects/Output
OUTPATH=~/stm32f105/FW/3851C0_PopDemo/$VER

echo "================================"
echo "Vizio SB3851C0 Pop demo MD5 generation"
echo '=='$VER'===='
echo "================================"

find $OUTPATH -type f -name "*.bin" -exec md5sum {} \;
find $OUTPATH -type f -name "*.hex" -exec md5sum {} \;
find $OUTPATH -type f -name "*.rar" -exec md5sum {} \;
find $OUTPATH -type f -name "*.txt" -exec md5sum {} \;
find $OUTPATH -type f -name "*.utv" -exec md5sum {} \;
find $OUTPATH -type f -name "*.apk" -exec md5sum {} \;
find $OUTPATH -type f -name "*.doc" -exec md5sum {} \;
find $OUTPATH -type f -name "*.ppt" -exec md5sum {} \;