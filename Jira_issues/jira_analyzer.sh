INPATH=$1

if [ "$INPATH" == "" ];then
    echo "using by ./jira_analyzer.sh test.txt filename"
    exit;
fi

echo "================================"
echo "JIRA data"
echo "================================"

rm -rf  class.txt amt.txt none_amt.txt

#grep '\[vizio_param_setting\]' $INPATH | sed 's/\[vizio_param_setting\]//g' | sed 's/^[[:space:]]*//g' >> tmp.log

cat $INPATH | sed 's/C	/\[C\]	/g' | sed 's/A	/\[A\]	/g' | sed 's/B	/\[B\]	/g'>> class.txt
grep -vi '\[APP\]\|\[CAST\]\|\[Vizio\]\|\[Apk\]\|\[Smartcast\]\|\[Amtran\]\|\[oobe\]' class.txt >>  amt.txt
grep -i '\[APP\]\|\[CAST\]\|\[Vizio\]\|\[Apk\]\|\[Smartcast\]\|\[Amtran\]\|\[oobe\]' class.txt >>  none_amt.txt

#cat none_amt.txt | grep -i '\[App\]' && cat none_amt.txt | grep -i '\[Cast\]' && cat none_amt.txt | grep -i '\[Vizio\]' && cat none_amt.txt | grep -i '\[Apk\]' && cat none_amt.txt | grep -i '\[Amtran\]' && cat none_amt.txt | grep -i '\[Smartcast\]' && cat none_amt.txt | grep -i '\[oobe\]' >>  none_amt.txt

echo 'None AmTran JIRA issues which werent reported to Vizio:'
grep -vi 'AMTCA-\|ATMCA' none_amt.txt
echo 'Total JIRA number : A = '$(grep -c '\[A\]' class.txt)' B = '$(grep -c '\[B\]' class.txt)' C = '$(grep -c '\[C\]' class.txt)

#sed -n -e '/vizio_amtran_GainControl1_param_setting_usage\: start here/,/vizio_amtran_GainControl1_param_setting_usage\: end here/ p' tmp.log >> GainControl1.log
#sed -n -e '/vizio_amtran_GainControl2_param_setting_usage\: start here/,/vizio_amtran_GainControl2_param_setting_usage\: end here/ p' tmp.log >> GainControl2.log
#sed -n -e '/vizio_amtran_MasterVolume_param_setting_usage\: start/,/vizio_amtran_MasterVolume_param_setting_usage\: end/ p' tmp.log >> mastervolume.log

#sed -n -e  '/SCC_AUD_SE_11BEQ_COEF_T EqCoef/ ,/\};/ p' tmp.log >> Array.log

echo "-------------------------------------"
