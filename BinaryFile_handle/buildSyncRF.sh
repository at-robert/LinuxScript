VER=$2
SVN=$3
INPATH=/Volumes/robert.lo/STM32/Haier_29_35/Projects/15_Haier/EWARM/Projects/Output
OUTPATH=/Volumes/robert.lo/STM32/Haier_2G_SB_FW

if [ "$1" == "" ];
then
    echo "using by ./buildSyncRF.sh MODEL_NAME"
    exit;
fi

MODEL_NAME=$1

if [ "$MODEL_NAME" == "29" ]; then
echo "===Converting Haier 29 Synccomm RF FW bin files =============="
cat H2921A_RF_FW.bin TWO-mode_Soundbar_0427_150422_2BBBFC64.bin > H1A120_SoundBar_RF_0427.bin
cat H2921A_RF_FW.bin TWO-mode_Soundbar_0422_150422_22ECFC64.bin > H1A120_SoundBar_RF_0422.bin
cat H2921A_RF_FW.bin TWO-mode_Soundbar_0513_150513_15C9311B.bin > H1A120_SoundBar_RF_0513.bin
cat H2921A_RF_FW.bin TWO-mode_Soundbar_0505_150505-2_2AC4311B.bin > H1A120_SoundBar_RF_0505.bin
cat H2921A_RF_FW.bin TWO-mode_Soundbar_V1.00E6_150714_15C9311B.bin > H1A120_SoundBar_RF_0714.bin
sync

elif [ "$MODEL_NAME" == "35" ]; then
echo "===Converting Haier 35 Synccomm RF FW bin files =============="
cat H3521A_RF_FW.bin TWO-mode_Soundbar_0422_150422_22ECFC64.bin > H3A360_SoundBar_RF_0422.bin
cat H3521A_RF_FW.bin TWO-mode_Soundbar_0427_150422_2BBBFC64.bin > H3A360_SoundBar_RF_0427.bin
cat H3521A_RF_FW.bin TWO-mode_Soundbar_0505_150505-2_2AC4311B.bin > H3A360_SoundBar_RF_0505.bin
cat H3521A_RF_FW.bin TWO-mode_Soundbar_0513_150513_15C9311B.bin > H3A360_SoundBar_RF_0513.bin
cat H3521A_RF_FW.bin TWO-mode_Soundbar_V1.00E6_150714_15C9311B.bin > H3A360_SoundBar_RF_0714.bin
sync

else

echo "===Converting Synccomm RF FW bin files =============="
cat H3521A_RF_FW.bin TWO-mode_Soundbar_0422_150422_22ECFC64.bin > H3A360_SoundBar_RF_0422.bin
cat H3521A_RF_FW.bin TWO-mode_Soundbar_0427_150422_2BBBFC64.bin > H3A360_SoundBar_RF_0427.bin
cat H3521A_RF_FW.bin TWO-mode_Soundbar_0505_150505-2_2AC4311B.bin > H3A360_SoundBar_RF_0505.bin
cat H3521A_RF_FW.bin TWO-mode_Soundbar_0513_150513_15C9311B.bin > H3A360_SoundBar_RF_0513.bin
cat H3521A_RF_FW.bin TWO-mode_Soundbar_V1.00E6_150714_15C9311B.bin > H3A360_SoundBar_RF_0714.bin
cat H2921A_RF_FW.bin TWO-mode_Soundbar_0427_150422_2BBBFC64.bin > H1A120_SoundBar_RF_0427.bin
cat H2921A_RF_FW.bin TWO-mode_Soundbar_0422_150422_22ECFC64.bin > H1A120_SoundBar_RF_0422.bin
cat H2921A_RF_FW.bin TWO-mode_Soundbar_0513_150513_15C9311B.bin > H1A120_SoundBar_RF_0513.bin
cat H2921A_RF_FW.bin TWO-mode_Soundbar_0505_150505-2_2AC4311B.bin > H1A120_SoundBar_RF_0505.bin
cat H2921A_RF_FW.bin TWO-mode_Soundbar_V1.00E6_150714_15C9311B.bin > H1A120_SoundBar_RF_0714.bin
sync

fi
