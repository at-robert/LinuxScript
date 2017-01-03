INPATH=$1

if [ "$INPATH" == "" ];then
    echo "using by ./extract_internal_dsp.sh test.txt filename"
    exit;
fi

echo "================================"
echo "Vizio Internal DSP extract data"
echo "================================"

rm -f  tmp.log GainControl.log Array.log

grep '\[vizio_param_setting\]' $INPATH | sed 's/\[vizio_param_setting\]//g' | sed 's/^[[:space:]]*//g' >> tmp.log

sed -n -e '/vizio_amtran_GainControl1_param_setting_usage\: start here/,/vizio_amtran_GainControl1_param_setting_usage\: end here/ p' tmp.log >> GainControl.log

sed -n -e  '/SCC_AUD_SE_11BEQ_COEF_T EqCoef/ ,/\};/ p' tmp.log >> Array.log

echo -e "\n-------------------------------------"
echo "Extract Data => GainControl.log , Array.log"
echo "-------------------------------------"
