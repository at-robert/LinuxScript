INPATH=$1
OUTPATH=./OUT

if [ "$INPATH" == "" ];then
    echo "using by ./extract_internal_dsp.sh INPATH"
    exit;
fi

echo "================================"
echo "Vizio Internal DSP extract data"
echo "================================"

#rm -rf  tmp.log GainControl1.log GainControl2.log Array.log mastervolume.log


if [ -d $OUTPATH ];
then
	echo "================================"
	echo "Outpath exists so that deleting it ........"
	echo "================================"
	rm -rf $OUTPATH
else
	echo "================================"
fi

mkdir $OUTPATH

for file in $(find $INPATH -type f -name "*.txt"); 
do
	echo $file
	filename=$(basename $file);
	grep '\[vizio_param_setting\]' $file | sed 's/\[vizio_param_setting\]//g' | sed 's/^[[:space:]]*//g' >> $OUTPATH/$filename'_tmp'.log
	grep '\[vizio_param_setting\]' $file | sed 's/\[vizio_param_setting\]//g' | sed 's/^[[:space:]]*//g' | sed -e '/SCC_AUD_SE_11BEQ_COEF_T EqCoef/ ,/\};/d' >> $OUTPATH/$filename'_program'.log
	#sed -n -e  '/SCC_AUD_SE_11BEQ_COEF_T EqCoef/ ,/\};/ p' $OUTPATH/$filename'_tmp'.log | sed '/\[*\]/d'  >> $OUTPATH/$filename'_Array'.log
	#sed -n -e  '/SCC_AUD_SE_11BEQ_COEF_T EqCoef/ ,/\};/ p' $OUTPATH/$filename'_tmp'.log | sed '/[a-zA-Z][a-zA-Z][a-zA-Z]*/d' >> $OUTPATH/$filename'_Array'.log
	sed -n -e  '/SCC_AUD_SE_11BEQ_COEF_T EqCoef/ ,/\};/ p' $file | sed 's/\[vizio_param_setting\]//g' | sed '/src*/d' | sed '/get*/d' | sed '/Sound*/d' | sed 's/^[[:space:]]*//g' | sed '/\[*\]/d' >> $OUTPATH/$filename'_Array'.log
	#cat $OUTPATH/$filename'_program'.log >> $OUTPATH/$filename'_Array'.log
done

echo -e "\n-------------------------------------"
echo "Extract Data => tmp.log , Array.log"
echo "-------------------------------------"
