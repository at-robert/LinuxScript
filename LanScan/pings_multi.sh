#!/bin/bash
# Program:
# 	Use Ping command to check NETWORK's Server state.
# 
# Copyright (c) 2019 Robert Lo
 
#color str
RED='\e[0;31m'
LIGHT_RED='\e[1;31m'
BLACK='\e[0;30m'
BLUE='\e[0;34m'
LIGHT_BLUE='\e[1;34m'
GREEN='\e[0;32m'
LIGHT_GREEN='\e[1;32m'
PURPLE='\e[0;35m'
LIGHT_PURPLE='\e[1;35m'
CYAN='\e[0;36m'
LIGHT_CYAN='\e[1;36m'
BROWN='\e[0;33m'
YELLOW='\e[1;33m'
DARK_GRAY='\e[1;30m'
END='\e[0m'
#color str - end

SCRIPT=${0##*/}
 
NETWORK="192.168.12"
IP_START="$1"
IP_END="$2"
IP_RESULT_FILE=~/Downloads/ip_result.txt
 
# --- start SCRIPT ---
trap 'stop' SIGUSR1 SIGINT SIGHUP SIGQUIT SIGTERM SIGSTOP
 
stop() {
	echo -e "\nStop ${SCRIPT} script ...."
	exit 0
}
 
help() {
	echo -e "
Usage: $SCRIPT [IP_START] [IP_END]
 
Example:
    $SCRIPT 1 254
	$SCRIPT 100 200
"
}
 
 
if [[ ! -z ${IP_START} && ! -z ${IP_END} ]]; then
	echo -e "\nStart ${SCRIPT} Scanner Server ...."

	echo "1" > $IP_RESULT_FILE
 
	for opt in $(seq ${IP_START} ${IP_END})
	do 
		if [ ${opt} == '87' ] || [ ${opt} == '113' ] || [ ${opt} == '116' ]; then 
            ping -c 1 -W 1 ${NETWORK}.${opt} &> /dev/null && result=0 || result=1
    
            if [ "${result}" == 0 ]; then
                printf "$LIGHT_GREEN Server ${NETWORK}.${opt} is UP. $END \n"
            else
                printf "$LIGHT_RED Server ${NETWORK}.${opt} is DOWN. $END \n"
            fi

            if [ "${result}" == 1 ] && [ ${opt} == '87' ] ; then
                echo "0" > $IP_RESULT_FILE
            fi
        fi
	done

	# IP_RESULT=$(cat "$IP_RESULT_FILE") 
	# printf "$LIGHT_CYAN IP Result = $IP_RESULT $END \n"

	# if [ $IP_RESULT -eq 1 ]; then
	# 	echo " IP Result = $IP_RESULT !!"
	# else
	#   	echo " IP Result = $IP_RESULT !!!"
	# fi

else
	help
 
fi