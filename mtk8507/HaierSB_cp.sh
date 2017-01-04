VER=$2
INPATH=/home/robert.lo/STM32/Haier_29_35/Projects/15_Haier/EWARM/Projects/Output
OUTPATH=/home/robert.lo/STM32/Haier_2G_SB_FW



echo "===Haier Sound Bar Copy file=============="
if [ "$1" == "29" ]; then
echo "Copy Haier 29 2.1 app"
cp $INPATH/H2921A/Application/H2921A.bin $OUTPATH/$VER/'HSX3A260_APP_'$VER.bin
md5sum $OUTPATH/$VER/'HSX3A260_APP_'$VER.bin
sync

elif [ "$1" == "35" ]; then
echo "Haier 35 2.1 app"
cp $INPATH/H3521A/Application/H3521A.bin $OUTPATH/$VER/'HSD3A360_APP_'$VER.bin
md5sum $OUTPATH/$VER/'HSD3A360_APP_'$VER.bin
sync

elif [ "$1" == "2920" ]; then
echo "Copy Haier 29 2.0 app"
cp $INPATH/H2921A/Application/H2921A.bin $OUTPATH/$VER/'HSX2A120_APP_'$VER.bin
md5sum $OUTPATH/$VER/'HSX2A120_APP_'$VER.bin
sync

elif [ "$1" == "2920r" ]; then
echo "Haier 29 2.0 release "$VER
cp $INPATH/H2921A/Release/H2921A_SMT.bin $OUTPATH/$VER/'HSX2A120_Release_'$VER.bin
md5sum $OUTPATH/$VER/'HSX2A120_Release_'$VER.bin
sync

elif [ "$1" == "29r" ]; then
echo "Haier 29 2.1 release "$VER
cp $INPATH/H2921A/Release/H2921A_SMT.bin $OUTPATH/$VER/'HSX3A260_Release_'$VER.bin
md5sum $OUTPATH/$VER/'HSX3A260_Release_'$VER.bin
sync

elif [ "$1" == "35r" ]; then
echo "Haier 35 2.1 release"
cp $INPATH/H3521A/Release/H3521A_SMT.bin $OUTPATH/$VER/'HSD3A360_Release_'$VER.bin
md5sum $OUTPATH/$VER/'HSD3A360_Release_'$VER.bin
sync

elif [ "$1" == "a" ]; then

if [ -d "$OUTPATH/$VER/" ]; then
 echo "$OUTPATH/$VER/ recreate"
 
 rm -rf $OUTPATH/$VER/
fi

 mkdir $OUTPATH/$VER/
 sync
 
echo "Copy Haier 29 2.0 app "$VER
cp $INPATH/H2921A/Application/H2921A.bin $OUTPATH/$VER/'HSX2A120_APP_'$VER.bin
md5sum $OUTPATH/$VER/'HSX2A120_APP_'$VER.bin

echo "Haier 29 2.0 release "$VER
cp $INPATH/H2921A/Release/H2921A_SMT.bin $OUTPATH/$VER/'HSX2A120_Release_'$VER.bin
md5sum $OUTPATH/$VER/'HSX2A120_Release_'$VER.bin
 
echo "Copy Haier 29 2.1 app "$VER
cp $INPATH/H2921A/Application/H2921A.bin $OUTPATH/$VER/'HSX3A260_APP_'$VER.bin
md5sum $OUTPATH/$VER/'HSX3A260_APP_'$VER.bin

echo "Haier 29 2.1 release "$VER
cp $INPATH/H2921A/Release/H2921A_SMT.bin $OUTPATH/$VER/'HSX3A260_Release_'$VER.bin
md5sum $OUTPATH/$VER/'HSX3A260_Release_'$VER.bin

echo "Haier 35 app 2.1 "$VER
cp $INPATH/H3521A/Application/H3521A.bin $OUTPATH/$VER/'HSD3A360_APP_'$VER.bin
md5sum $OUTPATH/$VER/'HSD3A360_APP_'$VER.bin

echo "Haier 35 2.1 release "$VER
cp $INPATH/H3521A/Release/H3521A_SMT.bin $OUTPATH/$VER/'HSD3A360_Release_'$VER.bin
md5sum $OUTPATH/$VER/'HSD3A360_Release_'$VER.bin

sync

else

echo "Needs at least 2 parameters"

fi
