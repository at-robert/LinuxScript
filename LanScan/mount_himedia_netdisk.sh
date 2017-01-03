# if [ "$#" -lt 1 ]; then
# 	echo "Usage: mount_himedia_netdisk.sh password"
# 	exit -1
# fi

read -s -p "Password: " password

HiMediaMacAddr=00:66:CF:01:2A:3E
HiMediaMacIP=$(echo "$password\n" | sudo -S nmap -sP 192.168.14.* | awk '/Nmap scan report for/{printf $5;}/MAC Address:/{print " => "$3;}' | grep -i "$HiMediaMacAddr" | sort)
HiMediaMacIP=$(echo "$HiMediaMacIP" | sed 's/=>//g' | sed 's/00:66:CF:01:2A:3E//g' | sed 's/^[ \t]*//g' | sed 's/[ \t]*$//g')
echo "HiMediaMacIP = $HiMediaMacIP"

mkdir /Volumes/himedia
mount -t smbfs //administrator:125321@$HiMediaMacIP/share /Volumes/himedia
password=xx