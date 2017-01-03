INPATH=$1

if [ "$#" -lt 1 ]; then
	echo "Usage: diff_matrix.sh [in PATH]"
	exit -1
fi

echo "$INPATH"

python excel_read_vizio_jira.py $INPATH/vizio.xlsx

cat $ININPATH/tmp.txt | grep "\[FCS\]" | grep "\[A\]" > $ININPATH/VizioJIRA.txt
echo " " >> $INPATH/VizioJIRA.txt 
cat $INPATH/tmp.txt | grep "\[FCS\]" | grep "\[B\]" >> $INPATH/VizioJIRA.txt
echo " " >> $INPATH/VizioJIRA.txt 
cat $INPATH/tmp.txt | grep "\[FCS\]" | grep "\[C\]" >> $INPATH/VizioJIRA.txt
echo " ====================================================" >> $INPATH/VizioJIRA.txt 
cat $INPATH/tmp.txt | grep "\[FCS-2\]" | grep "\[A\]" >> $INPATH/VizioJIRA.txt
echo " " >> $INPATH/VizioJIRA.txt 
cat $INPATH/tmp.txt | grep "\[FCS-2\]" | grep "\[B\]" >> $INPATH/VizioJIRA.txt
echo " " >> $INPATH/VizioJIRA.txt 
cat $INPATH/tmp.txt | grep "\[FCS-2\]" | grep "\[C\]" >> $INPATH/VizioJIRA.txt
