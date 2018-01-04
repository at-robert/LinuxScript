VER=$1
INPATH=~/mtk8507/FW/MCU/'4451_'$VER
OUTPATH=~/mtk8507/tools/Publish_Tool_with_dev_script/In

if [ "$VER" == "" ];then
    echo "the first parameter VER should not be empty"
    exit;
fi

echo "================================"
echo "Vizio SB4451C0/3851D0/3831D0/3830D0 All FW copy"
echo "NOTE: External DSP MCU code and mtk8507 bootloader bin files should be generated manually in advance!!"
echo "================================"

rm -rf $OUTPATH/*

cp -fv $INPATH/fwupdate_3830D0.bin $OUTPATH/
cp -fv $INPATH/fwupdate_3831D0.bin $OUTPATH/
cp -fv $INPATH/fwupdate_3851D0.bin $OUTPATH/
cp -fv $INPATH/fwupdate_4451C0.bin $OUTPATH/

cp -fv ~/mtk8507/Trunk/release/BDP_Generic/build/8507_linux_demo_dbg.bin $OUTPATH/mtkupg.bin

sync
