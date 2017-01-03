VER=$1
INPATH=/Volumes/robert.lo/STM32/Haier_29_35/Projects/15_Haier/EWARM/Projects/Output
OUTPATH=~/mtk8507/FW/PORTABLE/$VER

echo "================================"
echo "Vizio portable speaker MD5 generation"
echo '=='$VER'===='
echo "================================"

find $OUTPATH -type f -name "*" -exec md5sum {} \; | sed '/._.DS_Store/d' | sed '/.DS_Store/d' | sed 's/\/home\/robert.lo\/mtk8507\/FW\/PORTABLE/		/g'