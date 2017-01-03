adb kill-server
sleep 1
adb connect 192.168.14.180

echo "============================="
if [ "$1" == "i" ]; then
echo "Into the shell"
sleep 1:        
adb shell    
fi
