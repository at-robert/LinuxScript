VER=$1
SDK=$2
INPATH=~/Test/'4451_'$VER
OUTPATH=~/mtk8507/FW/$VER

if [ "$1" == "" ] || [ "$2" == "" ];
then
    echo "using by ./cpy_vizio_4451_all.sh VER SDK"
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


cp -r ~/mtk8507/FW/NEW $OUTPATH
mv $OUTPATH/MTK8507 $OUTPATH/MTK8507_HQ$SDK'_ExternalDSP'

#cp -fv $INPATH/fwupdate_4451C0.bin $OUTPATH/STM32F091/
#cp -fv $INPATH/fwupdate_3851D0.bin $OUTPATH/STM32F091/
#cp -fv $INPATH/fwupdate_3831D0.bin $OUTPATH/STM32F091/
#cp -fv $INPATH/fwupdate_3830D0.bin $OUTPATH/STM32F091/
cp -fv $INPATH/SB4451_C0_SMT.bin $OUTPATH/STM32F091/'SB4451_C0_SMT'_$VER.bin
cp -fv $INPATH/SB3851_D0_SMT.bin $OUTPATH/STM32F091/'SB3851_D0_SMT'_$VER.bin
cp -fv $INPATH/SB3831_D0_SMT.bin $OUTPATH/STM32F091/'SB3831_D0_SMT'_$VER.bin
cp -fv $INPATH/SB3830_D0_SMT.bin $OUTPATH/STM32F091/'SB3830_D0_SMT'_$VER.bin

cp -fv ~/mtk8507/Trunk/release/BDP_Generic/build/8507_linux_demo_dbg.bin $OUTPATH/MTK8507_HQ$SDK'_ExternalDSP'
cp -fv ~/mtk8507/Trunk/release/BDP_Generic/build/mt8507_bl_linux.bin $OUTPATH/MTK8507_HQ$SDK'_ExternalDSP'
#cp -fv ~/mtk8507/tools/bootloader_emmc/SU-6000_141225/mt8507_bl_linux_MICRON_ecc_256.bin $OUTPATH/MTK8507/bootloder_SMT_data/MICRON
#cp -fv ~/mtk8507/tools/bootloader_emmc/Ecctool_v1.7/mt8507_bl_linux_TOSHIBA_ecc.bin $OUTPATH/MTK8507/bootloder_SMT_data/TOSHIBA
sync
