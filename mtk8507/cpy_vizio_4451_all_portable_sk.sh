VER=$1
SDK=$2
SDK_STR=$SDK'_PortableSK'
TARGET_PATH='PORTABLE'
INPATH=~/Test/'4451_'$VER
OUTPATH=~/mtk8507/FW/$TARGET_PATH/$VER
OUTPATH_mtk8507=~/mtk8507/Trunk/portable_spk

if [ "$1" == "" ] || [ "$2" == "" ];
then
    echo "using by ./cpy_vizio_4451_all.sh VER SDK"
    exit;
fi

echo "================================"
echo "Vizio portable speaker Shell All FW copy"
echo "NOTE:  MCU code and mtk8507 bootloader bin files should be generated manually in advance!!"
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


cp -fv $OUTPATH_mtk8507/MCU_L051/$VER/'16'VizioShell_SMT.bin $OUTPATH/STM32L051/'16'VizioShell_SMT_$VER.bin


cp -fv $OUTPATH_mtk8507/BDP_Generic/build/8507_linux_demo_dbg.bin $OUTPATH/MTK8507_HQ$SDK_STR
cp -fv $OUTPATH_mtk8507/BDP_Generic/build/mt8507_bl_linux.bin $OUTPATH/MTK8507_HQ$SDK_STR
cp -fv ~/mtk8507/tools/bootloader_emmc/SU-6000_141225/mt8507_bl_linux_MICRON_ecc_256.bin $OUTPATH/MTK8507_HQ$SDK_STR/bootloder_SMT_data/MICRON
cp -fv ~/mtk8507/tools/bootloader_emmc/Ecctool_v1.7/mt8507_bl_linux_TOSHIBA_ecc.bin $OUTPATH/MTK8507_HQ$SDK_STR/bootloder_SMT_data/TOSHIBA
sync
