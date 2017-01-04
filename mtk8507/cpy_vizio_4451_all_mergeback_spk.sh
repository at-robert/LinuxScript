VER=$1
SUB=$2
MCUPATH=~/mtk8507/workspace_portable_spk/v$VER/release/BDP_Generic/custom/vizio_audio/res/amt_soundbar
OUTPATH=~/mtk8507/workspace_portable_spk/merge_back/v$VER-$SUB
MERGEPATH=~/mtk8507/workspace_portable_spk/merge_back

DESTAUTO_VER=~/mtk8507/workspace_portable_spk/dest/release/BDP_Generic/src/system/prop/version/auto_version.h
DEST_VER=$(grep 'AUTO_VERSION' $DESTAUTO_VER | awk '{print $3}' )

#color str
RED='\e[0;31m'
LIGHT_RED='\e[1;31m'
BLACK='\e[0;30m'
BLUE='\e[0;34m'
LIGHT_BLUE='\e[1;34m'
GREEN='\e[0;32m'
LIGHT_GREEN='\e[1;32m'
PURPLE='\e[0;35m'
LIGHT_PURPLE='\e[1;35m'
CYAN='\e[0;36m'
LIGHT_CYAN='\e[1;36m'
BROWN='\e[0;33m'
YELLOW='\e[1;33m'
DARK_GRAY='\e[1;30m'
END='\e[0m'
#color str - end

echo "==OUTPATH = $OUTPATH =="

if [ "$VER" == "" ];then
    echo -e "the first parameter $LIGHT_RED[VER]$END should not be empty"
    exit;
fi

if [ "$SUB" == "" ];then
    echo -e "the second parameter $LIGHT_RED[SUB]$END should not be empty"
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


cp -r ~/mtk8507/workspace_portable_spk/merge_back/NEW $OUTPATH

cp -fv $MCUPATH/fwupdate_0820.bin $OUTPATH/mcu_bins/

cp -fv ~/mtk8507/workspace_portable_spk/dest/release/BDP_Generic/build/8507_linux_demo_dbg.bin $OUTPATH/mtk8507_bins/
cp -fv ~/mtk8507/workspace_portable_spk/dest/release/BDP_Generic/build/mt8507_bl_linux.bin $OUTPATH/mtk8507_bins/
cp -fv ~/mtk8507/FW/release_note_spk/Release\ Notes\ for\ VIZIO\ SP30-E0_V$VER.pdf $OUTPATH/release_note/
cp -fv ~/mtk8507/workspace_portable_spk/dest/*.tar.gz $OUTPATH/mtk8507_source/

sync

cd $MERGEPATH
tar cvfz HQ$DEST_VER'_vizio_sb_merge_back_portable_SPK_v'$VER.tar.gz v$VER-$SUB

sync

echo "================================"
echo "Vizio SB4451/3851/3831/3830 MD5 generation"
echo "================================"

find $OUTPATH -type f -name "*.bin" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace_portable_spk\/merge_back/		/g'
find $OUTPATH -type f -name "*.rar" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace_portable_spk\/merge_back/		/g'
find $OUTPATH -type f -name "*.txt" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace_portable_spk\/merge_back/		/g'
find $OUTPATH -type f -name "*.utv" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace_portable_spk\/merge_back/		/g'
find $OUTPATH -type f -name "*.apk" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace_portable_spk\/merge_back/		/g'
find $OUTPATH -type f -name "*.doc" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace_portable_spk\/merge_back/		/g'
find $OUTPATH -type f -name "*.gz" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace_portable_spk\/merge_back/		/g'
find $OUTPATH -type f -name "*.pdf" -exec md5sum {} \; | sed 's/\/home\/robert.lo\/mtk8507\/workspace_portable_spk\/merge_back/		/g'

md5sum $MERGEPATH/HQ$DEST_VER'_vizio_sb_merge_back_portable_SPK_v'$VER.tar.gz | sed 's/\/home\/robert.lo\/mtk8507\/workspace_portable_spk\/merge_back/		/g'