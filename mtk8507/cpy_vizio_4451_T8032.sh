VER=$1
INPATH=/Volumes/robert.lo/STM32/Haier_29_35/Projects/15_Haier/EWARM/Projects/Output
OUTPATH=~/mtk8507/FW/$VER

echo "================================"
echo "Vizio SB4451/31C0 T8032 FW copy"
echo "================================"

cp -fv ~/mtk8507/Trunk/release/T8032/workspace/mt8563_T8032.bin ~/mtk8507/Trunk/release/BDP_Generic/res
cp -fv ~/mtk8507/Trunk/release/T8032/workspace/mt8563_T8032.bin ~/mtk8507/Trunk/release/BDP_Generic/custom/vizio_audio/res

cp -fv ~/mtk8507/Trunk/release/T8032/workspace/mt8563_T8032.bin ~/mtk8507/Trunk/svn/BDP_Generic/res
cp -fv ~/mtk8507/Trunk/release/T8032/workspace/mt8563_T8032.bin ~/mtk8507/Trunk/svn/BDP_Generic/custom/vizio_audio/res

sync
