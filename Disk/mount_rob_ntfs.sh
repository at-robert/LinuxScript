DRIVE=$1

if [ -d /Volumes/$DRIVE ];
then
	echo '== To mount '$DRIVE' as NTFS ===='
else
	echo '=='$DRIVE' doesnt exist ===='
	exit 0
fi

sudo umount /Volumes/$DRIVE/
sudo mkdir /Volumes/$DRIVE
sudo mount -o rw,auto,nobrowse -t ntfs /dev/disk5s1 /Volumes/$DRIVE
#sudo ln -s /Volumes/$DRIVE ~/Desktop/$DRIVE