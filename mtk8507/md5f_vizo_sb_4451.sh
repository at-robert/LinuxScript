VER=$1
INPATH=/Volumes/robert.lo/STM32/Haier_29_35/Projects/15_Haier/EWARM/Projects/Output
OUTPATH=~/mtk8507/FW/EXT_DSP/$VER

echo "================================"
echo "Vizio SB4451/31C0 MD5 generation"
echo '=='$VER'===='
echo "================================"




find $OUTPATH -type f -name "*.bin" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/FW\/EXT_DSP/		/g'
find $OUTPATH -type f -name "*.hex" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/FW\/EXT_DSP/		/g'
find $OUTPATH -type f -name "*.rar" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/FW\/EXT_DSP/		/g'
find $OUTPATH -type f -name "*.txt" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/FW\/EXT_DSP/		/g'
find $OUTPATH -type f -name "*.utv" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/FW\/EXT_DSP/		/g'
find $OUTPATH -type f -name "*.apk" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/FW\/EXT_DSP/		/g'
find $OUTPATH -type f -name "*.doc" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/FW\/EXT_DSP/		/g'
find $OUTPATH -type f -name "*.ppt" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/FW\/EXT_DSP/		/g'
find $OUTPATH -type f -name "*.pdf" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/FW\/EXT_DSP/		/g'