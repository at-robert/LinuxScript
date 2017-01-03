VER=$1
INPATH=~/Test/'4451_'$VER
OUTPATH=~/mtk8507/workspace/'v'$VER/release

echo "================================"
echo "Vizio SB4451C0/3851D0/3831D0/3830D0 MCU FW copy"
echo "================================"

cp -fv $INPATH/fwupdate_4451C0.bin $OUTPATH/BDP_Generic/custom/vizio_audio/res/amt_soundbar
cp -fv $INPATH/fwupdate_3851D0.bin $OUTPATH/BDP_Generic/custom/vizio_audio/res/amt_soundbar
cp -fv $INPATH/fwupdate_3831D0.bin $OUTPATH/BDP_Generic/custom/vizio_audio/res/amt_soundbar
cp -fv $INPATH/fwupdate_3830D0.bin $OUTPATH/BDP_Generic/custom/vizio_audio/res/amt_soundbar

sync
