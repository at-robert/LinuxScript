INFILE=$1
TYPE=$2
LIGHT_RED='\e[1;31m'
END='\e[0m'

if [ "$1" == "" ] || [ "$2" == "" ];
then
    echo -e "using by ./cal_ble_rssi_av.sh $LIGHT_RED[INFILE] [TYPE]$END"
    exit;
fi

if [ "$2" == "ios" ];
then
	printf "ios BLE rssi =\n"
	grep -r -B 3 "<BT_GATT> device is IOS, uuid = 69A3.*" $INFILE | grep "<BT_GATT> rssi =" | awk '{print $5}' | sed 's/\"//g' > tmp.txt
else
	printf "android BLE rssi =\n"
	grep -r -B 3 "<BT_GATT> device is Android, manu_spec_data = 01EF.*" android_ble_rssi.log | grep "<BT_GATT> rssi =" | awk '{print $5}' | sed 's/\"//g' > tmp.txt
fi

# count=0
# sum=0
# in=0

# while read line
# do
	# sum=`expr $in + $sum`
	# count=`expr $count + 1`
# done < tmp.txt

# echo "Total count = $count, Sum = $sum"