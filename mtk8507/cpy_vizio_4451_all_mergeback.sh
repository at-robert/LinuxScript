VER=$1
INPATH=~/Test/'4451_'$VER
OUTPATH=~/mtk8507/workspace/merge_back/v$VER

if [ "$VER" == "" ];then
    echo "the first parameter VER should not be empty"
    exit;
fi

echo "================================"
echo "Vizio SB4451C0/3851D0/3831D0/3830D0 mergeback copy"
echo "NOTE: External DSP MCU code mtk8507 source code and mtk8507 bootloader bin files should be generated manually in advance!!"
echo "================================"

if [ -d $OUTPATH ];
then
		echo "================================"
		echo "Outpath exists so that deleting it ........"
		echo "================================"
		rm -rf $OUTPATH
else
	echo "================================"
fi


cp -r ~/mtk8507/workspace/merge_back/NEW $OUTPATH

cp -fv $INPATH/fwupdate_4451C0.bin $OUTPATH/mcu_bins/
cp -fv $INPATH/fwupdate_3851D0.bin $OUTPATH/mcu_bins/
cp -fv $INPATH/fwupdate_3831D0.bin $OUTPATH/mcu_bins/
cp -fv $INPATH/fwupdate_3830D0.bin $OUTPATH/mcu_bins/


cp -fv ~/mtk8507/workspace/dest/release/BDP_Generic/build/8507_linux_demo_dbg.bin $OUTPATH/mtk8507_bins/
cp -fv ~/mtk8507/workspace/dest/release/BDP_Generic/build/mt8507_bl_linux.bin $OUTPATH/mtk8507_bins/
cp -fv ~/mtk8507/FW/release\ note/Release\ Notes\ for\ VIZIO\ SB4451_3851_3831_3830_V$VER.pdf $OUTPATH/release_note/
cp -fv ~/mtk8507/workspace/dest/*.tar.gz $OUTPATH/mtk8507_source/

sync

echo "================================"
echo "Vizio SB4451/3851/3831/3830 MD5 generation"
echo "================================"

find $OUTPATH -type f -name "*.bin" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace\/merge_back/		/g'
find $OUTPATH -type f -name "*.rar" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace\/merge_back/		/g'
find $OUTPATH -type f -name "*.txt" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace\/merge_back/		/g'
find $OUTPATH -type f -name "*.utv" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace\/merge_back/		/g'
find $OUTPATH -type f -name "*.apk" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace\/merge_back/		/g'
find $OUTPATH -type f -name "*.doc" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace\/merge_back/		/g'
find $OUTPATH -type f -name "*.gz" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace\/merge_back/		/g'
find $OUTPATH -type f -name "*.pdf" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace\/merge_back/		/g'