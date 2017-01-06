

OUTPATH=clean_sdk
BUILDAUTO_VER=$OUTPATH/release/BDP_Generic/src/system/prop/version/auto_version.h
MTK_TALBALL=8507_VIZIO_SPK_release.tar.gz


if [ -f $MTK_TALBALL ];
then
   echo "================================"
else
   echo "MTK talball $MTK_TALBALL doesn't exist"
   exit;
fi

rm -rf build_sdk/ merge_sdk/ mtk_sdk/ svn
mkdir -p build_sdk/release merge_sdk/release mtk_sdk/release svn


if [ -d $OUTPATH ];
then
		echo "================================"
		echo "$OUTPATH exists so that deleting it ........"
		echo "================================"
		rm -rf $OUTPATH
fi

mkdir -p $OUTPATH
tar xvf $MTK_TALBALL -C $OUTPATH

cd $OUTPATH/release/BDP_Linux/
tar xvf mtk-linux-3.10.26.tar.gz
tar xvf release_linux.tar.gz
rm mtk-linux-3.10.26.tar.gz
rm release_linux.tar.gz
cd ../../..

SDK_VER=$(grep 'AUTO_VERSION' $BUILDAUTO_VER | awk '{print $3}' )

echo "================================"
echo "MTK package = HQ$SDK_VER "
echo "================================"

touch $OUTPATH/readme_$SDK_VER.txt
mv $MTK_TALBALL $OUTPATH/$MTK_TALBALL

echo "================================"
echo "copy clean code to merge_sdk "
echo "================================"
cp -a $OUTPATH/release/* ./merge_sdk/release/

echo "================================"
echo "copy clean code to mtk_sdk "
echo "================================"
cp -a $OUTPATH/release/* ./mtk_sdk/release/