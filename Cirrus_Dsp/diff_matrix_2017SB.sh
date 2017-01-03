if [ "$#" -lt 1 ]; then
	echo "Usage: diff_matrix_2017SB.sh [in PATH]"
	exit -1
fi

DIR=$1
MOV_TRUON_SURON=$DIR/CCode_ac3/ac3-movie-TSHDon-TVon-2.h
MOV_TRUON_SUROFF=$DIR/CCode_ac3/ac3-movie-TSHDon-TVoff-2.h
MOV_TRUOFF_SURON=$DIR/CCode_ac3/ac3-movie-TSHDoff-TVon-2.h
MOV_TRUOFF_SUROFF=$DIR/CCode_ac3/ac3-movie-TSHDoff-TVoff-2.h

MUSIC_TRUON_SURON=$DIR/CCode_ac3/ac3-movie-TSHDon-TVon-2.h
MUSIC_TRUON_SUROFF=$DIR/CCode_ac3/ac3-movie-TSHDon-TVoff-2.h
MUSIC_TRUOFF_SURON=$DIR/CCode_ac3/ac3-movie-TSHDoff-TVon-2.h
MUSIC_TRUOFF_SUROFF=$DIR/CCode_ac3/ac3-movie-TSHDoff-TVoff-2.h


PCM_MOV_TRUON_SURON=$DIR/CCode_pcm/pcm-movie-TSHDon-TVon.h
PCM_MOV_TRUON_SUROFF=$DIR/CCode_pcm/pcm-movie-TSHDon-TVoff.h
PCM_MOV_TRUOFF_SURON=$DIR/CCode_pcm/pcm-movie-TSHDoff-TVon.h
PCM_MOV_TRUOFF_SUROFF=$DIR/CCode_pcm/pcm-movie-TSHDoff-TVoff.h

PCM_MUSIC_TRUON_SURON=$DIR/CCode_pcm/pcm-music-TSHDon-TVon.h
PCM_MUSIC_TRUON_SUROFF=$DIR/CCode_pcm/pcm-music-TSHDon-TVoff.h
PCM_MUSIC_TRUOFF_SURON=$DIR/CCode_pcm/pcm-music-TSHDoff-TVon.h
PCM_MUSIC_TRUOFF_SUROFF=$DIR/CCode_pcm/pcm-music-TSHDoff-TVoff.h

DTS_MOV_TRUON_SURON=$DIR/CCode_dts/dts-movie-TSHDon-TVon.h
DTS_MOV_TRUON_SUROFF=$DIR/CCode_dts/dts-movie-TSHDon-TVoff.h
DTS_MOV_TRUOFF_SURON=$DIR/CCode_dts/dts-movie-TSHDoff-TVon.h
DTS_MOV_TRUOFF_SUROFF=$DIR/CCode_dts/dts-movie-TSHDoff-TVoff.h

DTS_MUSIC_TRUON_SURON=$DIR/CCode_dts/dts-music-TSHDon-TVon.h
DTS_MUSIC_TRUON_SUROFF=$DIR/CCode_dts/dts-music-TSHDon-TVoff.h
DTS_MUSIC_TRUOFF_SURON=$DIR/CCode_dts/dts-music-TSHDoff-TVon.h
DTS_MUSIC_TRUOFF_SUROFF=$DIR/CCode_dts/dts-music-TSHDoff-TVoff.h


echo "//AC3 Movie TruVol off - Surround Off , TruVol off - Surround On - Mutli Channel"
# diff $MOV_TRUOFF_SURON $MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' 
diff $MOV_TRUOFF_SURON $MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//AC3 Movie TruVol off - Surround Off , TruVol on - Surround Off - Mutli Channel"
# diff $MOV_TRUON_SUROFF $MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $MOV_TRUON_SUROFF $MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//AC3 Movie TruVol off - Surround Off , TruVol on - Surround On - Mutli Channel"
# diff $MOV_TRUON_SURON $MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $MOV_TRUON_SURON $MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//AC3 Music TruVol off - Surround Off , TruVol off - Surround On - Mutli Channel"
# diff $MUSIC_TRUOFF_SURON $MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $MUSIC_TRUOFF_SURON $MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//AC3 Music TruVol off - Surround Off , TruVol on - Surround Off - Mutli Channel"
# diff $MUSIC_TRUON_SUROFF $MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $MUSIC_TRUON_SUROFF $MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//AC3 Music TruVol off - Surround Off , TruVol on - Surround On - Mutli Channel"
# diff $MUSIC_TRUON_SURON $MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $MUSIC_TRUON_SURON $MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'


echo "//AC3 Movie TruVol off - Surround Off , TruVol off - Surround On - Mutli Channel"
# diff $PCM_MOV_TRUOFF_SURON $PCM_MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $PCM_MOV_TRUOFF_SURON $PCM_MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//PCM Movie TruVol off - Surround Off , TruVol on - Surround Off - Mutli Channel"
# diff $PCM_MOV_TRUON_SUROFF $PCM_MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $PCM_MOV_TRUON_SUROFF $PCM_MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//PCM Movie TruVol off - Surround Off , TruVol on - Surround On - Mutli Channel"
# diff $PCM_MOV_TRUON_SURON $PCM_MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $PCM_MOV_TRUON_SURON $PCM_MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//PCM Music TruVol off - Surround Off , TruVol off - Surround On - Mutli Channel"
# diff $PCM_MUSIC_TRUOFF_SURON $PCM_MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $PCM_MUSIC_TRUOFF_SURON $PCM_MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//PCM Music TruVol off - Surround Off , TruVol on - Surround Off - Mutli Channel"
# diff $PCM_MUSIC_TRUON_SUROFF $PCM_MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $PCM_MUSIC_TRUON_SUROFF $PCM_MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//PCM Music TruVol off - Surround Off , TruVol on - Surround On - Mutli Channel"
# diff $PCM_MUSIC_TRUON_SURON $PCM_MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $PCM_MUSIC_TRUON_SURON $PCM_MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//DTS  Movie TruVol off - Surround Off , TruVol on - Surround Off - Mutli Channel"
# diff $DTS_MOV_TRUON_SUROFF $DTS_MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $DTS_MOV_TRUON_SUROFF $DTS_MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//DTS  Movie TruVol off - Surround Off , TruVol on - Surround On - Mutli Channel"
# diff $DTS_MOV_TRUON_SURON $DTS_MOV_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $DTS_MOV_TRUON_SURON $DTS_MOV_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//DTS  Music TruVol off - Surround Off , TruVol off - Surround On - Mutli Channel"
# diff $DTS_MUSIC_TRUOFF_SURON $DTS_MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $DTS_MUSIC_TRUOFF_SURON $DTS_MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//DTS  Music TruVol off - Surround Off , TruVol on - Surround Off - Mutli Channel"
# diff $DTS_MUSIC_TRUON_SUROFF $DTS_MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $DTS_MUSIC_TRUON_SUROFF $DTS_MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'

echo ""
echo "//DTS  Music TruVol off - Surround Off , TruVol on - Surround On - Mutli Channel"
# diff $DTS_MUSIC_TRUON_SURON $DTS_MUSIC_TRUOFF_SUROFF | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
diff $DTS_MUSIC_TRUON_SURON $DTS_MUSIC_TRUOFF_SUROFF | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g'
