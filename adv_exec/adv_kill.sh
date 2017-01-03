if [ "$1" == "" ];
then
    echo "using by ./adv_kill.sh ProcessName"
    exit;
fi

echo "Kill ProcessName = $1"
ps -ef | grep "$1" | grep -v grep
ps -ef | grep "$1" | grep -v grep | awk '{print $2}' | xargs kill