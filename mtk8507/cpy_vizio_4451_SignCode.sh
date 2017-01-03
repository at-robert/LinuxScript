VER=$1
SDK=$2

NEWFOLDER=~/mtk8507/FW/NEWSIGN
INPATH_MCU=~/Test/'4451_'$VER
INPATH=~/mtk8507/FW/Signed/v$VER
OUTPATH=~/mtk8507/FW/$VER'_PRO'
MTK8507_INSERTPATH=~/mtk8507/tools/bootloader_emmc
ECCTOOLPATH=~/mtk8507/tools/bootloader_emmc/Ecctool_v1.7

if [ "$1" == "" ] || [ "$2" == "" ];
then
    echo "using by ./cpy_vizio_4451_SignCode.sh VER SDK"
    exit;
fi

echo "================================"
echo "Vizio SB4451C0/3851D0/3831D0/3830D0 SignCode copy"
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


cp -r $NEWFOLDER $OUTPATH
mv $OUTPATH/MTK8507 $OUTPATH/MTK8507_HQ$SDK'_ExternalDSP'

echo "================================"
echo "Copy MCU files -----------------"
echo "================================"

if [ -f $INPATH_MCU/SB4451_C0_SMT.bin ] && [ -f $INPATH_MCU/SB3851_D0_SMT.bin ] && [ -f $INPATH_MCU/SB3831_D0_SMT.bin ] && [ -f $INPATH_MCU/SB3830_D0_SMT.bin ];
then
    echo "================================"
else
    echo "MCU file doesn't exist"
    exit;
fi

cp -fv $INPATH_MCU/SB4451_C0_SMT.bin $OUTPATH/STM32F091/'SB4451_C0_SMT'_$VER.bin
cp -fv $INPATH_MCU/SB3851_D0_SMT.bin $OUTPATH/STM32F091/'SB3851_D0_SMT'_$VER.bin
cp -fv $INPATH_MCU/SB3831_D0_SMT.bin $OUTPATH/STM32F091/'SB3831_D0_SMT'_$VER.bin
cp -fv $INPATH_MCU/SB3830_D0_SMT.bin $OUTPATH/STM32F091/'SB3830_D0_SMT'_$VER.bin

sync

echo "================================"
echo "Copy MTK8507 bin files -----------------"
echo "================================"

tar -zxvf $INPATH/*.tgz
cp -fv $INPATH/mtkupg.bin $OUTPATH/MTK8507_HQ$SDK'_ExternalDSP'/8507_linux_demo_dbg.bin
cp -fv $INPATH/mt8507_bl_linux.bin $OUTPATH/MTK8507_HQ$SDK'_ExternalDSP'/
cp -fv $INPATH/*.utv $OUTPATH/ULI/

rename 's/\.utv/_PRO\.utv/g' $OUTPATH/ULI/*.utv

rm -rf $OUTPATH/ULI/updatelogic.txt
find $OUTPATH/ULI/ -name *.utv -exec basename {} \; >> $OUTPATH/ULI/updatelogic.txt

#read -p "Please modify updatelogic.txt manually and then press [Enter] key to continue.."

sync

echo "================================"
echo "Copy MTK8507 insertion bin files -----------------"
echo "================================"

rm -rf $MTK8507_INSERTPATH/SU-6000_141225/mt8507_bl_linux_MICRON_ecc.bin
rm -rf $MTK8507_INSERTPATH/SU-6000_141225/mt8507_bl_linux_MICRON_ecc_256.bin
rm -rf $MTK8507_INSERTPATH/Ecctool_v1.7/mt8507_bl_linux_TOSHIBA_ecc.bin
rm -rf $MTK8507_INSERTPATH/Ecctool_v1.7/mt8507_bl_linux_MICRON_ecc.bin
rm -rf $MTK8507_INSERTPATH/Ecctool_v1.7/mt8507_bl_linux.bin

cp -fv $INPATH/mt8507_bl_linux.bin $MTK8507_INSERTPATH/Ecctool_v1.7/

sync
sleep 1

cd $ECCTOOLPATH

./EccTool -x -s ./mt8507_bl_linux.bin -o ./mt8507_bl_linux_MICRON_ecc.bin  -n [MICRON]MT29F4G08ABAEA
sync
cp mt8507_bl_linux_MICRON_ecc.bin ../SU-6000_141225
sync
./EccTool -x -s ./mt8507_bl_linux.bin -o ./mt8507_bl_linux_TOSHIBA_ecc.bin  -n [TOSHIBA]TC58NVG2S0HTA00

cd ~

cp -fv $MTK8507_INSERTPATH/Ecctool_v1.7/mt8507_bl_linux_TOSHIBA_ecc.bin $OUTPATH/MTK8507_HQ$SDK'_ExternalDSP'/bootloder_SMT_data/TOSHIBA
cp -fv $MTK8507_INSERTPATH/Ecctool_v1.7/mt8507_bl_linux_MICRON_ecc.bin $MTK8507_INSERTPATH/SU-6000_141225/

echo "================================"
read -p "Please generate MICRON flash bin file manually in Windows environment and then press [Enter] key to continue.."

sync

if [ -f $MTK8507_INSERTPATH/SU-6000_141225/mt8507_bl_linux_MICRON_ecc_256.bin ];
then
    echo "================================"
else
    echo "MTK8507 Micron insertion file doesn't exist"
    exit;
fi

cp -fv $MTK8507_INSERTPATH/SU-6000_141225/mt8507_bl_linux_MICRON_ecc_256.bin $OUTPATH/MTK8507_HQ$SDK'_ExternalDSP'/bootloder_SMT_data/MICRON

sync

echo "================================"
echo "Vizio SB4451/3851/3831/3830 MD5 generation"
echo "================================"

find $OUTPATH -type f -name "*.bin" -exec md5sum {} \;
find $OUTPATH -type f -name "*.hex" -exec md5sum {} \;
find $OUTPATH -type f -name "*.rar" -exec md5sum {} \;
find $OUTPATH -type f -name "*.txt" -exec md5sum {} \;
find $OUTPATH -type f -name "*.utv" -exec md5sum {} \;
find $OUTPATH -type f -name "*.apk" -exec md5sum {} \;
find $OUTPATH -type f -name "*.doc" -exec md5sum {} \;
find $OUTPATH -type f -name "*.gz" -exec md5sum {} \;
find $OUTPATH -type f -name "*.ppt" -exec md5sum {} \;