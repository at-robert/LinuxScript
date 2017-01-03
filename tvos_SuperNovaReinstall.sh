    echo " [MSD8830 Supernova debug tvos]"
    echo "============================="
if [ "$1" == "t" ]; then
	echo "Move Supernova_tw to the target"
adb push /Volumes/robert.lo/msd8830/Supernova_tw/dev/Supernova/target/europe_dtv.napoli/tmp_image/tvservice/applications/bin/tvos /tvservice/applications/bin
elif [ "$1" == "m" ]; then
	echo "Move Supernova_ms to the target"
adb push /Volumes/robert.lo/msd8830/Supernova_ms/dev/Supernova/target/europe_dtv.napoli/tmp_image/tvservice/applications/bin/tvos /tvservice/applications/bin
elif [ "$1" == "r" ]; then
	echo "Move Supernova_trial to the target"
adb push /Volumes/robert.lo/msd8830/Supernova_trial/dev/Supernova/target/europe_dtv.napoli/tmp_image/tvservice/applications/bin/tvos /tvservice/applications/bin
else
	echo "Move Supernova to the target"
adb push /Volumes/robert.lo/msd8830/Supernova/dev/Supernova/target/atsc.napoli/tmp_image/tvservice/applications/bin/tvos /tvservice/applications/bin
fi



