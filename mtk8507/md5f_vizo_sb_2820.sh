VER=$1

OUTPATH=~/stm32f105/FW/VIZIO_SB_2017/SB2820/S2820A_V$VER'_RELEASE'
SPI_VER=$(hd -n 6 -x $OUTPATH/S2820A_V$VER'_SPI_FLASH'.bin | grep "00000000" | awk '{print $2$3$4$5$6$7}')

echo "================================"
echo "Vizio SB2820/SB2820 MD5 generation"
echo '=='$VER'===='
echo "================================"

find $OUTPATH -type f -name "*" -exec md5sum {} \; | sed '/._.DS_Store/d' | sed '/.DS_Store/d' | sed 's/\/home\/robert.lo\/stm32f105\/FW\/VIZIO_SB_2017\/SB2820/		/g'

SPI_VER=$(echo $SPI_VER | tr 'a-z' 'A-Z')
echo "=== SPI FLASH VERSION 0x$SPI_VER ==="