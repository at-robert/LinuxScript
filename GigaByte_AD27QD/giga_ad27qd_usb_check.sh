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

USB20A_MD5_AUTH='f3b76e93a8f7c62fd3a925c06cd86b07'
USB30A_MD5_AUTH='4268819723a2ee81d20e78ec7435081c'
USB20B_MD5_AUTH='87ac56e88da12cbbd0e87d9a776397c8'
USB30B_MD5_AUTH='11cc7304da69a03cb62f96e1d0bbab13'

USB20A_PATH=/media/rob/USB20A/USB20A.bin
USB30A_PATH=/media/rob/USB30A/USB30A.bin
USB20B_PATH=/media/rob/USB20B/USB20B.bin
USB30B_PATH=/media/rob/USB30B/USB30B.bin

# == To check the connection and test file existing ==============
if [ -f $USB20A_PATH ];
then
    printf "$GREEN= $USB20A_PATH file detected !! === \n $END"
else
    printf "$RED= $USB20A_PATH file isn't detected !! === \n $END"
    printf "$RED= Please check your connection !! === \n $END"
    exit
fi

if [ -f $USB30A_PATH ];
then
    printf "$GREEN= $USB30A_PATH file detected !! === \n $END"
else
    printf "$RED= $USB30A_PATH file isn't detected !! === \n $END"
    printf "$RED= Please check your connection !! === \n $END"
    exit
fi

if [ -f $USB20B_PATH ];
then
    printf "$GREEN= $USB20B_PATH file detected !! === \n $END"
else
    printf "$RED= $USB20B_PATH file isn't detected !! === \n $END"
    printf "$RED= Please check your connection !! === \n $END"
    exit
fi

if [ -f $USB30B_PATH ];
then
    printf "$GREEN= $USB30B_PATH file detected !! === \n $END"
else
    printf "$RED= $USB30B_PATH file isn't detected !! === \n $END"
    printf "$RED= Please check your connection !! === \n $END"
    exit
fi
# == To check the connection and test file existing ==============

# == To read and check MD5 sum of the file
USB20A_MD5=$(md5sum $USB20A_PATH | awk '{print $1}')
printf "$GREEN= $USB20A_PATH MD5 SUM = $USB20A_MD5 !! === \n $END"

USB30A_MD5=$(md5sum $USB30A_PATH | awk '{print $1}')
printf "$GREEN= $USB30A_PATH MD5 SUM = $USB30A_MD5 !! === \n $END"

USB20B_MD5=$(md5sum $USB20B_PATH | awk '{print $1}')
printf "$GREEN= $USB20B_PATH MD5 SUM = $USB20B_MD5 !! === \n $END"

USB30B_MD5=$(md5sum $USB30B_PATH | awk '{print $1}')
printf "$GREEN= $USB30B_PATH MD5 SUM = $USB30B_MD5 !! === \n $END"
# == To read and check MD5 sum of the file

if [ "$USB20A_MD5" == "$USB20A_MD5_AUTH" ];
then
    printf "$GREEN= USB20A MD5 Correct !! === \n $END"
else
    printf "$RED= USB20A MD5 isn't Correct !! === \n $END"
fi

if [ "$USB30A_MD5" == "$USB30A_MD5_AUTH" ];
then
    printf "$GREEN= USB30A MD5 Correct !! === \n $END"
else
    printf "$RED= USB30A MD5 isn't Correct !! === \n $END"
fi

if [ "$USB20B_MD5" == "$USB20B_MD5_AUTH" ];
then
    printf "$GREEN= USB20B MD5 Correct !! === \n $END"
else
    printf "$RED= USB20B MD5 isn't Correct !! === \n $END"
fi

if [ "$USB30B_MD5" == "$USB30B_MD5_AUTH" ];
then
    printf "$GREEN= USB30B MD5 Correct !! === \n $END"
else
    printf "$RED= USB30B MD5 isn't Correct !! === \n $END"
fi