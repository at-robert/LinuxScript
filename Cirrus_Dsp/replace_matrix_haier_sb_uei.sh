MODEL=UEI_sound_bar_20160513
AUDIO_OUT_PATH=/Volumes/robert.lo/audio_tuning_merge/$MODEL/h3521a_dsp_uld
AUDIO_IN_AC3_PATH=/Volumes/robert.lo/audio_tuning_merge/$MODEL/multi
AUDIO_IN_PCM_PATH=/Volumes/robert.lo/audio_tuning_merge/$MODEL/pcm

OS_IN_FILE_AC3=os_ha_cfg0_48L11_61_2_2_15.h
OS_OUT_FILE_AC3=os_hd2_rc94.h
INGAIN_IN_FILE_AC3=Uei-3520-ac3-160509_cfg0_48L11_61_0100.h
INGAIN_OUT_FILE_AC3=ac3_in_gain.h
CROSSBAR_IN_FILE_AC3=crossbar_cfg0_48L10_61_01_rc2.h
CROSSBAR_OUT_FILE_AC3=crossbar_rc28.h

INGAIN_IN_FILE_PCM=Uei-3520-pcm-160510_cfg0_48L11_61_0100.h
INGAIN_OUT_FILE_PCM=pcm_in_gain.h


SPOFF_SVLOFF_IN_AC3=ac3-SPTLoff_SVLoff-160509.h
SPOFF_SVLON_IN_AC3=ac3-SPTLoff_SVLon-160509.h
SPON_SVLOFF_IN_AC3=ac3-SPTLon_SVLoff-160509.h
SPON_SVLON_IN_AC3=ac3-SPTLon_SVLon-160509.h

SPOFF_SVLOFF_OUT_AC3=ac3_SPLOFF_SVLOFF.h
SPOFF_SVLON_OUT_AC3=ac3_SPLOFF_SVLON.h
SPON_SVLOFF_OUT_AC3=ac3_SPLON_SVLOFF.h
SPON_SVLON_OUT_AC3=ac3_SPLON_SVLON.h

SPOFF_SVLOFF_IN_PCM=SPTLoff_SVLoff-160509.h
SPOFF_SVLON_IN_PCM=SPTLoff_SVLon-160509.h
SPON_SVLOFF_IN_PCM=SPTLon_SVLoff-160509.h
SPON_SVLON_IN_PCM=SPTLon_SVLon-160509.h

SPOFF_SVLOFF_OUT_PCM=pcm_SPLOFF_SVLOFF.h
SPOFF_SVLON_OUT_PCM=pcm_SPLOFF_SVLON.h
SPON_SVLOFF_OUT_PCM=pcm_SPLON_SVLOFF.h
SPON_SVLON_OUT_PCM=pcm_SPLON_SVLON.h


if [ -f $AUDIO_IN_AC3_PATH/preKickStart.h ] && [ -f $AUDIO_OUT_PATH/preKickStart.h ];
then
    echo "=========[AC3 preKickStart]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/preKickStart.h $AUDIO_OUT_PATH/preKickStart.h 
else
    echo "check AC3 preKickStart file"
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

if [ -f $AUDIO_IN_AC3_PATH/$INGAIN_IN_FILE_AC3 ] && [ -f $AUDIO_OUT_PATH/$INGAIN_OUT_FILE_AC3  ];
then
    echo "=========[AC3 In Gain]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$INGAIN_IN_FILE_AC3 $AUDIO_OUT_PATH/$INGAIN_OUT_FILE_AC3
else
    echo "check AC3 In Gain file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/initial.h ] && [ -f $AUDIO_OUT_PATH/ac3_initial.h  ];
then
    echo "=========[AC3 Init]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/initial.h $AUDIO_OUT_PATH/ac3_initial.h
else
    echo "check AC3 Init file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$CROSSBAR_IN_FILE_AC3 ] && [ -f $AUDIO_OUT_PATH/$CROSSBAR_OUT_FILE_AC3 ];
then
    echo "=========[AC3 Crossbar]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$CROSSBAR_IN_FILE_AC3 $AUDIO_OUT_PATH/$CROSSBAR_OUT_FILE_AC3
else
    echo "check AC3 Crossbar file"
    exit;
fi





if [ -f $AUDIO_IN_PCM_PATH/$INGAIN_IN_FILE_PCM ] && [ -f $AUDIO_OUT_PATH/$INGAIN_OUT_FILE_PCM  ];
then
    echo "=========[PCM In Gain]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$INGAIN_IN_FILE_PCM $AUDIO_OUT_PATH/$INGAIN_OUT_FILE_PCM
else
    echo "check PCM In Gain file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/initial.h ] && [ -f $AUDIO_OUT_PATH/ac3_initial.h  ];
then
    echo "=========[PCM Init]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/initial.h $AUDIO_OUT_PATH/pcm_initial.h
else
    echo "check PCM Init file"
    exit;
fi


if [ -f $AUDIO_IN_AC3_PATH/$SPOFF_SVLOFF_IN_AC3 ] && [ -f $AUDIO_OUT_PATH/$SPOFF_SVLOFF_OUT_AC3 ];
then
    echo "=========[AC3 SPL OFF SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$SPOFF_SVLOFF_IN_AC3 $AUDIO_OUT_PATH/$SPOFF_SVLOFF_OUT_AC3
else
    echo "check AC3 SPL OFF SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$SPOFF_SVLON_IN_AC3 ] && [ -f $AUDIO_OUT_PATH/$SPOFF_SVLON_OUT_AC3 ];
then
    echo "=========[AC3 SPL OFF SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$SPOFF_SVLON_IN_AC3 $AUDIO_OUT_PATH/$SPOFF_SVLON_OUT_AC3
else
    echo "check AC3 SPL OFF SVL ON file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$SPON_SVLOFF_IN_AC3 ] && [ -f $AUDIO_OUT_PATH/$SPON_SVLOFF_OUT_AC3 ];
then
    echo "=========[AC3 SPL ON SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$SPON_SVLOFF_IN_AC3 $AUDIO_OUT_PATH/$SPON_SVLOFF_OUT_AC3
else
    echo "check AC3 SPL ON SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_AC3_PATH/$SPON_SVLON_IN_AC3 ] && [ -f $AUDIO_OUT_PATH/$SPON_SVLON_OUT_AC3 ];
then
    echo "=========[AC3 SPL ON SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_AC3_PATH/$SPON_SVLON_IN_AC3 $AUDIO_OUT_PATH/$SPON_SVLON_OUT_AC3
else
    echo "check AC3 SPL ON SVL ON file"
    exit;
fi



if [ -f $AUDIO_IN_PCM_PATH/$SPOFF_SVLOFF_IN_PCM ] && [ -f $AUDIO_OUT_PATH/$SPOFF_SVLOFF_OUT_PCM ];
then
    echo "=========[PCM SPL OFF SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$SPOFF_SVLOFF_IN_PCM $AUDIO_OUT_PATH/$SPOFF_SVLOFF_OUT_PCM
else
    echo "check PCM SPL OFF SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$SPOFF_SVLON_IN_PCM ] && [ -f $AUDIO_OUT_PATH/$SPOFF_SVLON_OUT_PCM ];
then
    echo "=========[PCM SPL OFF SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$SPOFF_SVLON_IN_PCM $AUDIO_OUT_PATH/$SPOFF_SVLON_OUT_PCM
else
    echo "check PCM SPL OFF SVL ON file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$SPON_SVLOFF_IN_PCM ] && [ -f $AUDIO_OUT_PATH/$SPON_SVLOFF_OUT_PCM ];
then
    echo "=========[PCM SPL ON SVL OFF]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$SPON_SVLOFF_IN_PCM $AUDIO_OUT_PATH/$SPON_SVLOFF_OUT_PCM
else
    echo "check PCM SPL ON SVL OFF file"
    exit;
fi

if [ -f $AUDIO_IN_PCM_PATH/$SPON_SVLON_IN_PCM ] && [ -f $AUDIO_OUT_PATH/$SPON_SVLON_OUT_PCM ];
then
    echo "=========[PCM SPL ON SVL ON]==========="
    ./replace_matrix.sh $AUDIO_IN_PCM_PATH/$SPON_SVLON_IN_PCM $AUDIO_OUT_PATH/$SPON_SVLON_OUT_PCM
else
    echo "check PCM SPL ON SVL ON file"
    exit;
fi



echo "replacing successful!!!"





