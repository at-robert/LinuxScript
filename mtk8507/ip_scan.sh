# tranquoclinh.it@gmail.com
#! /bin/bash
 
list_ip=$(sudo nmap -sU --script nbstat.nse -p137 $1 | egrep 'report' | cut -d " " -f 5)
 
if [ ! $? -eq 0 ]
then
 sudo echo "Can not found!" ; exit 1
fi
 
sudo echo -e "\rIP-Address \t Host-Name \t MAC-Address" >> tmp.txt
 
for i in $list_ip
do
 host=$(sudo nmap -sU --script nbstat.nse -p137 $i | egrep 'NetBIOS' | xargs | cut -d " " -f 4)
 host_trim=${host%?}
 mac=$(sudo nmap -sU --script nbstat.nse -p137 $i | egrep 'NetBIOS' | xargs | cut -d " " -f 10)
 
 sudo echo -e "\r$i \t $host_trim \t $mac" >> tmp.txt
done
 
sudo cat tmp.txt | column -t
 
sudo rm tmp.txt
 
exit 0