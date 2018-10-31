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

USBAUDIO_DEV=$(aplay -l | grep 'USB Advanced Audio Device' | awk '{print $5}')

if [ "$USBAUDIO_DEV" == 'Advanced' ];
then
    printf "$GREEN= CMedia Sound card detected !! === \n $END"
    sleep 2
    printf "$GREEN= CMedia route microphone to speaker !! === \n $END"
    pactl load-module module-loopback latency_msec=1
    exit
else
    printf "$RED= CMedia Sound card isn't detected !! === \n $END"
    printf "$RED= Wait 3 seconds !! === \n $END"
    sleep 3
fi

USBAUDIO_DEV=$(aplay -l | grep 'USB Advanced Audio Device' | awk '{print $5}')

if [ "$USBAUDIO_DEV" == 'Advanced' ];
then
    printf "$GREEN= CMedia Sound card detected !! === \n $END"
    sleep 2
    printf "$GREEN= CMedia route microphone to speaker !! === \n $END"
    pactl load-module module-loopback latency_msec=1
    exit
else
    printf "$RED= CMedia Sound card isn't detected !! === \n $END"
    printf "$RED= Wait 3 seconds !! === \n $END"
    sleep 3
fi

USBAUDIO_DEV=$(aplay -l | grep 'USB Advanced Audio Device' | awk '{print $5}')

if [ "$USBAUDIO_DEV" == 'Advanced' ];
then
    printf "$GREEN= CMedia Sound card detected !! === \n $END"
    sleep 2
    printf "$GREEN= CMedia route microphone to speaker !! === \n $END"
    pactl load-module module-loopback latency_msec=1
    exit
else
    printf "$RED= CMedia Sound card isn't detected !! === \n $END"
    printf "$RED= Wait 3 seconds !! === \n $END"
    sleep 3
fi

USBAUDIO_DEV=$(aplay -l | grep 'USB Advanced Audio Device' | awk '{print $5}')

if [ "$USBAUDIO_DEV" == 'Advanced' ];
then
    printf "$GREEN= CMedia Sound card detected !! === \n $END"
    sleep 2
    printf "$GREEN= CMedia route microphone to speaker !! === \n $END"
    pactl load-module module-loopback latency_msec=1
    exit
else
    printf "$RED= CMedia Sound card isn't detected !! === \n $END"
    printf "$RED= Check your cable connection !! === \n $END"
fi