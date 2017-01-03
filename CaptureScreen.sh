adb shell screencap -p /tmp/screen.png
adb pull /tmp/screen.png
mv screen.png /Volumes/robert.lo/`date '+ %Y%m%d%H%M%S'`.png