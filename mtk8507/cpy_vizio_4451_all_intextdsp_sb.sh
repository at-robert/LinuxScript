VER=$1
#INPATH=~/mtk8507/FW/MCU/'4451_'$VER
TARGET_PATH='INT_EXT_DSP'
OUTPATH=~/mtk8507/FW/$TARGET_PATH/$VER
OUTPATH_mtk8507=~/mtk8507/Trunk/int_ext

BUILDAUTO_VER=$OUTPATH_mtk8507/BDP_Generic/src/system/prop/version/auto_version.h
BUILD_VER=$(grep 'AUTO_VERSION' $BUILDAUTO_VER | awk '{print $3}' )
echo "=Build Auto Version= "$BUILD_VER"==="

SDK=$BUILD_VER
SDK_STR=$SDK'_IntExtDSP'

#if [ "$1" == "" ] || [ "$2" == "" ];
if [ "$1" == "" ];
then
    echo "using by ./cpy_vizio_4451_all.sh VER"
    exit;
fi




echo "================================"
echo "Vizio SB4451C0/3851D0/3831D0/3830D0 All FW copy"
echo "NOTE: External DSP MCU code and mtk8507 bootloader bin files should be generated manually in advance!!"
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


cp -r ~/mtk8507/FW/$TARGET_PATH/NEW $OUTPATH
mv $OUTPATH/MTK8507 $OUTPATH/MTK8507_HQ$SDK_STR


#cp -fv $INPATH/SB4451_C0_SMT.bin $OUTPATH/STM32F091/'SB4451_C0_SMT'_$VER.bin
#cp -fv $INPATH/SB3851_D0_SMT.bin $OUTPATH/STM32F091/'SB3851_D0_SMT'_$VER.bin
#cp -fv $INPATH/SB3831_D0_SMT.bin $OUTPATH/STM32F091/'SB3831_D0_SMT'_$VER.bin
#cp -fv $INPATH/SB3830_D0_SMT.bin $OUTPATH/STM32F091/'SB3830_D0_SMT'_$VER.bin

cp -fv $OUTPATH_mtk8507/BDP_Generic/build/8507_linux_demo_dbg.bin $OUTPATH/MTK8507_HQ$SDK_STR
cp -fv $OUTPATH_mtk8507/BDP_Generic/build/mt8507_bl_linux.bin $OUTPATH/MTK8507_HQ$SDK_STR
cp -fv ~/mtk8507/FW/release_note_intext/Release\ Notes\ for\ VIZIO\ SB4451_3851_3831_3830_IntExt_V$VER.pdf $OUTPATH/release_note/
#cp -fv ~/mtk8507/tools/bootloader_emmc/SU-6000_141225/mt8507_bl_linux_MICRON_ecc_256.bin $OUTPATH/MTK8507/bootloder_SMT_data/MICRON
#cp -fv ~/mtk8507/tools/bootloader_emmc/Ecctool_v1.7/mt8507_bl_linux_TOSHIBA_ecc.bin $OUTPATH/MTK8507/bootloder_SMT_data/TOSHIBA
sync
