VER=$1
INPATH=~/mtk8507/FW/MCU/'4451_'$VER
OUTPATH=~/mtk8507/Trunk/int_ext
OUTPATH_SVN=~/mtk8507/Trunk/int_ext_svn
OUTPATH_SVN_SECURE=~/mtk8507/Trunk/svn_secure

if [ "$VER" == "" ];then
    echo "the first parameter VER should not be empty"
    exit;
fi

echo "================================"
echo "Vizio SB4451C0/3851D0/3831D0/3830D0 MCU FW copy"
echo "================================"

cp -fv $INPATH/fwupdate_4451C0.bin $OUTPATH/BDP_Generic/custom/vizio_audio/res/amt_soundbar
cp -fv $INPATH/fwupdate_4451C0.bin $OUTPATH_SVN/BDP_Generic/custom/vizio_audio/res/amt_soundbar
#cp -fv $INPATH/fwupdate_4451C0.bin $OUTPATH_SVN_SECURE/BDP_Generic/custom/vizio_audio/res/amt_soundbar

cp -fv $INPATH/fwupdate_3851D0.bin $OUTPATH/BDP_Generic/custom/vizio_audio/res/amt_soundbar
cp -fv $INPATH/fwupdate_3851D0.bin $OUTPATH_SVN/BDP_Generic/custom/vizio_audio/res/amt_soundbar
#cp -fv $INPATH/fwupdate_3851D0.bin $OUTPATH_SVN_SECURE/BDP_Generic/custom/vizio_audio/res/amt_soundbar

cp -fv $INPATH/fwupdate_3831D0.bin $OUTPATH/BDP_Generic/custom/vizio_audio/res/amt_soundbar
cp -fv $INPATH/fwupdate_3831D0.bin $OUTPATH_SVN/BDP_Generic/custom/vizio_audio/res/amt_soundbar
#cp -fv $INPATH/fwupdate_3831D0.bin $OUTPATH_SVN_SECURE/BDP_Generic/custom/vizio_audio/res/amt_soundbar

cp -fv $INPATH/fwupdate_3830D0.bin $OUTPATH/BDP_Generic/custom/vizio_audio/res/amt_soundbar
cp -fv $INPATH/fwupdate_3830D0.bin $OUTPATH_SVN/BDP_Generic/custom/vizio_audio/res/amt_soundbar
#cp -fv $INPATH/fwupdate_3830D0.bin $OUTPATH_SVN_SECURE/BDP_Generic/custom/vizio_audio/res/amt_soundbar
sync
