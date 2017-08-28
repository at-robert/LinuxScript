weeknumber=`date +%V`
One=1
wkp=$(($weeknumber + $One))
echo "Week number plus one:$wkp"