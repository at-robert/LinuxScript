VER=$1

OUTPATH=~/stm32f105/FW/VIZIO_SB_2017/SB3251/S3251A_V$VER'_RELEASE'
SPI_VER=$(hd -n 6 -x $OUTPATH/S3251A_V$VER'_SPI_FLASH'.bin | grep "00000000" | awk '{print $2$3$4$5$6$7}')

echo "================================"
echo "Vizio SB3251/SB2820 MD5 generation"
echo '=='$VER'===='
echo "================================"

find $OUTPATH -type f -name "*" -exec md5sum {} \; | sed '/._.DS_Store/d' | sed '/.DS_Store/d' | sed 's/\/home\/robert.lo\/stm32f105\/FW\/VIZIO_SB_2017\/SB3251/		/g'

SPI_VER=$(echo $SPI_VER | tr 'a-z' 'A-Z')
echo "=== SPI FLASH VERSION 0x$SPI_VER ==="