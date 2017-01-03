
#Need to check these input file name
SYSTOOL_PATH=/Volumes/robert.lo/audio_tuning_merge/vizio_sound_bar_20160512
AUDIO_OUT_PATH=$SYSTOOL_PATH/s3851_dsp_uld_3651_22
#Need to check ======================

AUDIO_OUT_PATH_2CH=$AUDIO_OUT_PATH/'2CH'
AUDIO_OUT_PATH_MC=$AUDIO_OUT_PATH/MC
AUDIO_IN_AC3_PATH=$SYSTOOL_PATH/multi
AUDIO_IN_PCM_PATH=$SYSTOOL_PATH/pcm

#Need to check these input file name
OS_IN_FILE_AC3=os_hd2_ab_495304_20_01_rc96.h
TVCS2_IN_FILE_PCM=tv_cs2_48_a_495314_20_00_rc6.h
INGAIN_IN_FILE_AC3=2017-v-slim-3651-22height-multi-V002_b_495314_20_0100.h
CROSSBAR_IN_FILE_AC3=crossbar_a_495304_20_01_rc28.h
INGAIN_IN_FILE_PCM=2017-v-slim-3651-22height-stereo-V002_b_495314_20_0100.h
#Need to check ======================

OS_OUT_FILE_AC3=os_hd2_rc_x.h
TVCS2_OUT_FILE_PCM=tvcsii_2ch.h
INGAIN_OUT_FILE_AC3=in_gain_MC.h
CROSSBAR_OUT_FILE_AC3=crossbar_MC.h
INGAIN_OUT_FILE_PCM=in_gain_2ch.h

#Multi channels
#Need to check these input file name
MOVIE_SPOFF_SVLOFF_IN_AC3=Multi-Movie-SndOFF-TVoff-V2.h
MOVIE_SPOFF_SVLON_IN_AC3=Multi-Movie-SndOFF-TVon-V2.h
MOVIE_SPON_SVLOFF_IN_AC3=Multi-Movie-SndON-TVoff-V2.h
MOVIE_SPON_SVLON_IN_AC3=Multi-Movie-SndON-TVon-V2.h
MUSIC_SPOFF_SVLOFF_IN_AC3=Multi-Music-SndOFF-TVoff-V2.h
MUSIC_SPOFF_SVLON_IN_AC3=Multi-Music-SndOFF-TVon-V2.h
MUSIC_SPON_SVLOFF_IN_AC3=Multi-Music-SndON-TVoff-V2.h
MUSIC_SPON_SVLON_IN_AC3=Multi-Music-SndON-TVon-V2.h
#Need to check ======================

MOVIE_SPOFF_SVLOFF_OUT_AC3=MC_Movie_SurrOff_TrueVolOff.h
MOVIE_SPOFF_SVLON_OUT_AC3=MC_Movie_SurrOff_TrueVolOn.h
MOVIE_SPON_SVLOFF_OUT_AC3=MC_Movie_SurrON_TrueVolOff.h
MOVIE_SPON_SVLON_OUT_AC3=MC_Movie_SurrON_TrueVolOn.h
MUSIC_SPOFF_SVLOFF_OUT_AC3=MC_Music_SurrOff_TrueVolOff.h
MUSIC_SPOFF_SVLON_OUT_AC3=MC_Music_SurrOff_TrueVolOn.h
MUSIC_SPON_SVLOFF_OUT_AC3=MC_Music_SurrON_TrueVolOff.h
MUSIC_SPON_SVLON_OUT_AC3=Mc_Music_SurrON_TrueVolOn.h

#2 Channels
#Need to check these input file name
MOVIE_SPOFF_SVLOFF_IN_PCM=pcm-movie-surndOFF-TvolOFF-v2.h
MOVIE_SPOFF_SVLON_IN_PCM=pcm-movie-surndOFF-TvolON-v2.h
MOVIE_SPON_SVLOFF_IN_PCM=pcm-movie-surndON-TvolOFF-v2.h
MOVIE_SPON_SVLON_IN_PCM=pcm-movie-surndON-TvolON-v2.h
MUSIC_SPOFF_SVLOFF_IN_PCM=pcm-music-surndOFF-TvolOFF-v2.h
MUSIC_SPOFF_SVLON_IN_PCM=pcm-music-surndOFF-TvolON-v2.h
MUSIC_SPON_SVLOFF_IN_PCM=pcm-music-surndON-TvolOFF-v2.h
MUSIC_SPON_SVLON_IN_PCM=pcm-music-surndON-TvolON-v2.h
#Need to check ======================

MOVIE_SPOFF_SVLOFF_OUT_PCM=2CH_Movie_SurrOff_TrueVolOff.h
MOVIE_SPOFF_SVLON_OUT_PCM=2CH_Movie_SurrOff_TrueVolOn.h
MOVIE_SPON_SVLOFF_OUT_PCM=2CH_Movie_SurrON_TrueVolOff.h
MOVIE_SPON_SVLON_OUT_PCM=2CH_Movie_SurrON_TrueVolOn.h
MUSIC_SPOFF_SVLOFF_OUT_PCM=2CH_Music_SurrOff_TrueVolOff.h
MUSIC_SPOFF_SVLON_OUT_PCM=2CH_Music_SurrOff_TrueVolOn.h
MUSIC_SPON_SVLOFF_OUT_PCM=2CH_Music_SurrON_TrueVolOff.h
MUSIC_SPON_SVLON_OUT_PCM=2CH_Music_SurrON_TrueVolOn.h
# ========================================


if [ -f $AUDIO_IN_PCM_PATH/$TVCS2_IN_FILE_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$TVCS2_OUT_FILE_PCM ];
then
    echo "=========[PCM TVCS2]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$TVCS2_IN_FILE_PCM $AUDIO_OUT_PATH_2CH/$TVCS2_OUT_FILE_PCM
else
    echo "check PCM TVCS2 file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$OS_IN_FILE_AC3 ] && [ -f $AUDIO_OUT_PATH/$OS_OUT_FILE_AC3  ];
then
    echo "=========[AC3 OS]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$OS_IN_FILE_AC3 $AUDIO_OUT_PATH/$OS_OUT_FILE_AC3
else
    echo "check AC3 OS file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/KickStart.h ] && [ -f $AUDIO_OUT_PATH/KickStart.h  ];
then
    echo "=========[AC3 KickStart]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/KickStart.h $AUDIO_OUT_PATH/KickStart.h
else
    echo "check AC3 KickStart file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$INGAIN_IN_FILE_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$INGAIN_OUT_FILE_AC3  ];
then
    echo "=========[AC3 In Gain]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$INGAIN_IN_FILE_AC3 $AUDIO_OUT_PATH_MC/$INGAIN_OUT_FILE_AC3
else
    echo "check AC3 In Gain file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$CROSSBAR_IN_FILE_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$CROSSBAR_OUT_FILE_AC3 ];
then
    echo "=========[AC3 Crossbar]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$CROSSBAR_IN_FILE_AC3 $AUDIO_OUT_PATH_MC/$CROSSBAR_OUT_FILE_AC3
else
    echo "check AC3 Crossbar file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$INGAIN_IN_FILE_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$INGAIN_OUT_FILE_PCM  ];
then
    echo "=========[PCM In Gain]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$INGAIN_IN_FILE_PCM $AUDIO_OUT_PATH_2CH/$INGAIN_OUT_FILE_PCM
else
    echo "check PCM In Gain file"
    exit;
fi


#Multi channels
if [ -f $AUDIO_IN_AC3_PATH/$MOVIE_SPOFF_SVLOFF_IN_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$MOVIE_SPOFF_SVLOFF_OUT_AC3 ];
then
    echo "=========[Movie AC3 SPL OFF SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$MOVIE_SPOFF_SVLOFF_IN_AC3 $AUDIO_OUT_PATH_MC/$MOVIE_SPOFF_SVLOFF_OUT_AC3
else
    echo "check Movie AC3 SPL OFF SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$MOVIE_SPOFF_SVLON_IN_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$MOVIE_SPOFF_SVLON_OUT_AC3 ];
then
    echo "=========[Movie AC3 SPL OFF SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$MOVIE_SPOFF_SVLON_IN_AC3 $AUDIO_OUT_PATH_MC/$MOVIE_SPOFF_SVLON_OUT_AC3
else
    echo "check Movie AC3 SPL OFF SVL ON file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$MOVIE_SPON_SVLOFF_IN_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$MOVIE_SPON_SVLOFF_OUT_AC3 ];
then
    echo "=========[Movie AC3 SPL ON SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$MOVIE_SPON_SVLOFF_IN_AC3 $AUDIO_OUT_PATH_MC/$MOVIE_SPON_SVLOFF_OUT_AC3
else
    echo "check Movie AC3 SPL ON SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$MOVIE_SPON_SVLON_IN_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$MOVIE_SPON_SVLON_OUT_AC3 ];
then
    echo "=========[Movie AC3 SPL ON SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$MOVIE_SPON_SVLON_IN_AC3 $AUDIO_OUT_PATH_MC/$MOVIE_SPON_SVLON_OUT_AC3
else
    echo "check Movie AC3 SPL ON SVL ON file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$MUSIC_SPOFF_SVLOFF_IN_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$MUSIC_SPOFF_SVLOFF_OUT_AC3 ];
then
    echo "=========[Music AC3 SPL OFF SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$MUSIC_SPOFF_SVLOFF_IN_AC3 $AUDIO_OUT_PATH_MC/$MUSIC_SPOFF_SVLOFF_OUT_AC3
else
    echo "check Music AC3 SPL OFF SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$MUSIC_SPOFF_SVLON_IN_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$MUSIC_SPOFF_SVLON_OUT_AC3 ];
then
    echo "=========[Music AC3 SPL OFF SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$MUSIC_SPOFF_SVLON_IN_AC3 $AUDIO_OUT_PATH_MC/$MUSIC_SPOFF_SVLON_OUT_AC3
else
    echo "check Music AC3 SPL OFF SVL ON file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$MUSIC_SPON_SVLOFF_IN_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$MUSIC_SPON_SVLOFF_OUT_AC3 ];
then
    echo "=========[Music AC3 SPL ON SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$MUSIC_SPON_SVLOFF_IN_AC3 $AUDIO_OUT_PATH_MC/$MUSIC_SPON_SVLOFF_OUT_AC3
else
    echo "check Music AC3 SPL ON SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$MUSIC_SPON_SVLON_IN_AC3 ] && [ -f $AUDIO_OUT_PATH_MC/$MUSIC_SPON_SVLON_OUT_AC3 ];
then
    echo "=========[Music AC3 SPL ON SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$MUSIC_SPON_SVLON_IN_AC3 $AUDIO_OUT_PATH_MC/$MUSIC_SPON_SVLON_OUT_AC3
else
    echo "check Music AC3 SPL ON SVL ON file"
    exit;
fi


#2 channels
if [ -f $AUDIO_IN_PCM_PATH/$MOVIE_SPOFF_SVLOFF_IN_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$MOVIE_SPOFF_SVLOFF_OUT_PCM ];
then
    echo "=========[MOVIE PCM SPL OFF SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$MOVIE_SPOFF_SVLOFF_IN_PCM $AUDIO_OUT_PATH_2CH/$MOVIE_SPOFF_SVLOFF_OUT_PCM
else
    echo "check MOVIE PCM SPL OFF SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$MOVIE_SPOFF_SVLON_IN_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$MOVIE_SPOFF_SVLON_OUT_PCM ];
then
    echo "=========[MOVIE PCM SPL OFF SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$MOVIE_SPOFF_SVLON_IN_PCM $AUDIO_OUT_PATH_2CH/$MOVIE_SPOFF_SVLON_OUT_PCM
else
    echo "check MOVIE PCM SPL OFF SVL ON file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$MOVIE_SPON_SVLOFF_IN_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$MOVIE_SPON_SVLOFF_OUT_PCM ];
then
    echo "=========[MOVIE PCM SPL ON SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$MOVIE_SPON_SVLOFF_IN_PCM $AUDIO_OUT_PATH_2CH/$MOVIE_SPON_SVLOFF_OUT_PCM
else
    echo "check MOVIE PCM SPL ON SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$MOVIE_SPON_SVLON_IN_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$MOVIE_SPON_SVLON_OUT_PCM ];
then
    echo "=========[MOVIE PCM SPL ON SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$MOVIE_SPON_SVLON_IN_PCM $AUDIO_OUT_PATH_2CH/$MOVIE_SPON_SVLON_OUT_PCM
else
    echo "check MOVIE PCM SPL ON SVL ON file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$MUSIC_SPOFF_SVLOFF_IN_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$MUSIC_SPOFF_SVLOFF_OUT_PCM ];
then
    echo "=========[MUSIC PCM SPL OFF SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$MUSIC_SPOFF_SVLOFF_IN_PCM $AUDIO_OUT_PATH_2CH/$MUSIC_SPOFF_SVLOFF_OUT_PCM
else
    echo "check MUSIC PCM SPL OFF SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$MUSIC_SPOFF_SVLON_IN_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$MUSIC_SPOFF_SVLON_OUT_PCM ];
then
    echo "=========[MUSIC PCM SPL OFF SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$MUSIC_SPOFF_SVLON_IN_PCM $AUDIO_OUT_PATH_2CH/$MUSIC_SPOFF_SVLON_OUT_PCM
else
    echo "check MUSIC PCM SPL OFF SVL ON file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$MUSIC_SPON_SVLOFF_IN_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLOFF_OUT_PCM ];
then
    echo "=========[MUSIC PCM SPL ON SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$MUSIC_SPON_SVLOFF_IN_PCM $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLOFF_OUT_PCM
else
    echo "check MUSIC PCM SPL ON SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$MUSIC_SPON_SVLON_IN_PCM ] && [ -f $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLON_OUT_PCM ];
then
    echo "=========[MUSIC PCM SPL ON SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$MUSIC_SPON_SVLON_IN_PCM $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLON_OUT_PCM
else
    echo "check MUSIC PCM SPL ON SVL ON file"
    exit;
fi


echo "replacing successful!!!"
echo "================================"
exit 

sync
read -p "Please press [Enter] key to continue.."



echo "//Movie TruVol on - Surround On - Mutli Channel"
diff $AUDIO_OUT_PATH_MC/$MOVIE_SPON_SVLON_OUT_AC3 $AUDIO_OUT_PATH_MC/$MOVIE_SPOFF_SVLON_OUT_AC3 | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//Movie TruVol on - Surround Off - Mutli Channel"
diff $AUDIO_OUT_PATH_MC/$MOVIE_SPON_SVLON_OUT_AC3 $AUDIO_OUT_PATH_MC/$MOVIE_SPOFF_SVLON_OUT_AC3 | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//Movie TruVol off - Surround On - Mutli Channel"
diff $AUDIO_OUT_PATH_MC/$MOVIE_SPON_SVLOFF_OUT_AC3 $AUDIO_OUT_PATH_MC/$MOVIE_SPOFF_SVLOFF_OUT_AC3 | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "Movie TruVol off - Surround Off - Mutli Channel"
diff $AUDIO_OUT_PATH_MC/$MOVIE_SPON_SVLOFF_OUT_AC3 $AUDIO_OUT_PATH_MC/$MOVIE_SPOFF_SVLOFF_OUT_AC3 | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//Music TruVol on - Surround On - Mutli Channel"
diff $AUDIO_OUT_PATH_MC/$MUSIC_SPON_SVLON_OUT_AC3 $AUDIO_OUT_PATH_MC/$MUSIC_SPOFF_SVLON_OUT_AC3 | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//Music TruVol on - Surround Off - Mutli Channel"
diff $AUDIO_OUT_PATH_MC/$MUSIC_SPON_SVLON_OUT_AC3 $AUDIO_OUT_PATH_MC/$MUSIC_SPOFF_SVLON_OUT_AC3 | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//Music TruVol off - Surround On - Mutli Channel"
diff $AUDIO_OUT_PATH_MC/$MUSIC_SPON_SVLOFF_OUT_AC3 $AUDIO_OUT_PATH_MC/$MUSIC_SPOFF_SVLOFF_OUT_AC3 | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//Music TruVol off - Surround Off - Mutli Channel"
diff $AUDIO_OUT_PATH_MC/$MUSIC_SPON_SVLOFF_OUT_AC3 $AUDIO_OUT_PATH_MC/$MUSIC_SPOFF_SVLOFF_OUT_AC3 | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'



echo ""
echo "//PCM_MOVie TruVol on - Surround On - 2 Channel"
diff $AUDIO_OUT_PATH_2CH/$MOVIE_SPON_SVLON_OUT_PCM $AUDIO_OUT_PATH_2CH/$MOVIE_SPOFF_SVLON_OUT_PCM | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//PCM_MOVie TruVol on - Surround Off - 2 Channel"
diff $AUDIO_OUT_PATH_2CH/$MOVIE_SPON_SVLON_OUT_PCM $AUDIO_OUT_PATH_2CH/$MOVIE_SPOFF_SVLON_OUT_PCM | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//PCM_MOVie TruVol off - Surround On - 2 Channel"
diff $AUDIO_OUT_PATH_2CH/$MOVIE_SPON_SVLOFF_OUT_PCM $AUDIO_OUT_PATH_2CH/$MOVIE_SPOFF_SVLOFF_OUT_PCM | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//PCM_MOVie TruVol off - Surround Off - 2 Channel"
diff $AUDIO_OUT_PATH_2CH/$MOVIE_SPON_SVLOFF_OUT_PCM $AUDIO_OUT_PATH_2CH/$MOVIE_SPOFF_SVLOFF_OUT_PCM | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//PCM_MUSIC TruVol on - Surround On - 2 Channel"
diff $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLON_OUT_PCM $AUDIO_OUT_PATH_2CH/$MUSIC_SPOFF_SVLON_OUT_PCM | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//PCM_MUSIC TruVol on - Surround Off - 2 Channel"
diff $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLON_OUT_PCM $AUDIO_OUT_PATH_2CH/$MUSIC_SPOFF_SVLON_OUT_PCM | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'

echo ""
echo "//PCM_MUSIC TruVol off - Surround On - 2 Channel"
diff $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLOFF_OUT_PCM $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLOFF_OUT_PCM | grep "<" | grep "0x" | tr -d "<"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'
echo "//PCM_MUSIC TruVol off - Surround Off - 2 Channel"
diff $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLOFF_OUT_PCM $AUDIO_OUT_PATH_2CH/$MUSIC_SPON_SVLOFF_OUT_PCM | grep ">" | grep "0x" | tr -d ">"  | tr -d "\r" | tr -d " " | sed 's/^[ \t]*//g' | sed 's/^/CS49xxxxSPI_CommandWrite(/' | sed 's/$/);/g' | sed 's/,);/);/g'


