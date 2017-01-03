if [ "$#" -lt 1 ]; then
	echo "Usage: diff_matrix.sh [in PATH]"
	exit -1
fi

DIR=$1
MOV_TRUON_SURON=$DIR/MC/MC_Movie_SurrOn_TrueVolOn.h
MOV_TRUON_SUROFF=$DIR/MC/MC_Movie_SurrOff_TrueVolOn.h
MOV_TRUOFF_SURON=$DIR/MC/MC_Movie_SurrOn_TrueVolOff.h
MOV_TRUOFF_SUROFF=$DIR/MC/MC_Movie_SurrOff_TrueVolOff.h

MUSIC_TRUON_SURON=$DIR/MC/MC_Music_SurrOn_TrueVolOn.h
MUSIC_TRUON_SUROFF=$DIR/MC/MC_Music_SurrOff_TrueVolOn.h
MUSIC_TRUOFF_SURON=$DIR/MC/MC_Music_SurrOn_TrueVolOff.h
MUSIC_TRUOFF_SUROFF=$DIR/MC/MC_Music_SurrOff_TrueVolOff.h


PCM_MOV_TRUON_SURON=$DIR/2CH/2CH_Movie_SurrOn_TrueVolOn.h
PCM_MOV_TRUON_SUROFF=$DIR/2CH/2CH_Movie_SurrOff_TrueVolOn.h
PCM_MOV_TRUOFF_SURON=$DIR/2CH/2CH_Movie_SurrOn_TrueVolOff.h
PCM_MOV_TRUOFF_SUROFF=$DIR/2CH/2CH_Movie_SurrOff_TrueVolOff.h

PCM_MUSIC_TRUON_SURON=$DIR/2CH/2CH_Music_SurrOn_TrueVolOn.h
PCM_MUSIC_TRUON_SUROFF=$DIR/2CH/2CH_Music_SurrOff_TrueVolOn.h
PCM_MUSIC_TRUOFF_SURON=$DIR/2CH/2CH_Music_SurrOn_TrueVolOff.h
PCM_MUSIC_TRUOFF_SUROFF=$DIR/2CH/2CH_Music_SurrOff_TrueVolOff.h


echo "//Movie TruVol on - Surround On - Mutli Channel"
diff $MOV_TRUON_SURON $MOV_TRUON_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//Movie TruVol on - Surround Off - Mutli Channel"
diff $MOV_TRUON_SURON $MOV_TRUON_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//Movie TruVol off - Surround On - Mutli Channel"
diff $MOV_TRUOFF_SURON $MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "Movie TruVol off - Surround Off - Mutli Channel"
diff $MOV_TRUOFF_SURON $MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//Music TruVol on - Surround On - Mutli Channel"
diff $MUSIC_TRUON_SURON $MUSIC_TRUON_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//Music TruVol on - Surround Off - Mutli Channel"
diff $MUSIC_TRUON_SURON $MUSIC_TRUON_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//Music TruVol off - Surround On - Mutli Channel"
diff $MUSIC_TRUOFF_SURON $MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//Music TruVol off - Surround Off - Mutli Channel"
diff $MUSIC_TRUOFF_SURON $MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//PCM_MOVie TruVol on - Surround On - 2 Channel"
diff $PCM_MOV_TRUON_SURON $PCM_MOV_TRUON_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//PCM_MOVie TruVol on - Surround Off - 2 Channel"
diff $PCM_MOV_TRUON_SURON $PCM_MOV_TRUON_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//PCM_MOVie TruVol off - Surround On - 2 Channel"
diff $PCM_MOV_TRUOFF_SURON $PCM_MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//PCM_MOVie TruVol off - Surround Off - 2 Channel"
diff $PCM_MOV_TRUOFF_SURON $PCM_MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//PCM_MUSIC TruVol on - Surround On - 2 Channel"
diff $PCM_MUSIC_TRUON_SURON $PCM_MUSIC_TRUON_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//PCM_MUSIC TruVol on - Surround Off - 2 Channel"
diff $PCM_MUSIC_TRUON_SURON $PCM_MUSIC_TRUON_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//PCM_MUSIC TruVol off - Surround On - 2 Channel"
diff $PCM_MUSIC_TRUOFF_SURON $PCM_MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//PCM_MUSIC TruVol off - Surround Off - 2 Channel"
diff $PCM_MUSIC_TRUOFF_SURON $PCM_MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'


#diff $MOV_TRUON_SURON $MOV_TRUON_SUROFF -y -W 60  | grep "|" | grep "0x"
# echo "Movie TruVol off - Surround On/off - Mutli Channel"
# diff $MOV_TRUOFF_SURON $MOV_TRUOFF_SUROFF -y -W 60  | grep "|" | grep "0x"

# echo "Music TruVol off - Surround On/off - Mutli Channel"
# diff $MUSIC_TRUON_SURON $MUSIC_TRUON_SUROFF -y -W 60  | grep "|" | grep "0x"
# echo "Music TruVol off - Surround On/off - Mutli Channel"
# diff $MUSIC_TRUOFF_SURON $MUSIC_TRUOFF_SUROFF -y -W 60  | grep "|" | grep "0x"


# echo "Movie TruVol on - Surround On/off - 2 Channel"
# diff $PCM_MOV_TRUON_SURON $PCM_MOV_TRUON_SUROFF -y -W 60  | grep "|" | grep "0x"
# echo "Movie TruVol off - Surround On/off - 2 Channel"
# diff $PCM_MOV_TRUOFF_SURON $PCM_MOV_TRUOFF_SUROFF -y -W 60  | grep "|" | grep "0x"

# echo "Music TruVol off - Surround On/off - 2 Channel"
# diff $PCM_MUSIC_TRUON_SURON $PCM_MUSIC_TRUON_SUROFF -y -W 60  | grep "|" | grep "0x"
# echo "Music TruVol off - Surround On/off - 2 Channel"
# diff $PCM_MUSIC_TRUOFF_SURON $PCM_MUSIC_TRUOFF_SUROFF -y -W 60  | grep "|" | grep "0x"
