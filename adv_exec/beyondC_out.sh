
INPUTFILE=$1

if [ "$1" == "" ];
then
    echo "using by ./beyoundC_out.sh INPUTFILE"
    exit;
fi

grep "diff -r .*" $INPUTFILE | sed 's/diff -r//g' | awk '{print $1}' | sort | uniq > tmp.txt
sed -e 's/^/cp --parents /' tmp.txt > output.txt
cp -fv output.txt tmp.txt
sed -e 's/$/ ~\/mtk8516\/Patch/' tmp.txt > output.txt