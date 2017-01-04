VER=$1
INPATH=~/mtk8507/Trunk/int_ext
SVNPATH=~/mtk8507/Trunk/int_ext_svn

echo "================================"
echo "Vizio SB4451/31C0 T8032 FW copy"
echo "================================"

cp -fv $INPATH/T8032/workspace/mt8563_T8032.bin $INPATH/BDP_Generic/res
cp -fv $INPATH/T8032/workspace/mt8563_T8032.bin $INPATH/BDP_Generic/custom/vizio_audio/res

cp -fv $INPATH/T8032/workspace/mt8563_T8032.bin $SVNPATH/BDP_Generic/res
cp -fv $INPATH/T8032/workspace/mt8563_T8032.bin $SVNPATH/BDP_Generic/custom/vizio_audio/res

sync
