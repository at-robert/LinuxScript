Main functions are:
a. Audio route from microphone to speaker (giga_ad27qd_audio_route.sh)
b. USB drive test (USB2.0 and USB3.0) (giga_ad27qd_usb_check.sh)
c. To play test wave file (fireplace.sh)

STEPS: (These actions were verified on Raspberry Pi 3b+)
1. To download and install Ubuntu Mate (16.04) for Raspberry Pi 

2. To install modules:
sudo apt-get install libasound-dev portaudio19-dev libportaudio2 libportaudiocpp0
sudo apt-get install ffmpeg libav-tools
sudo pip install pyaudio

sudo apt-get install build-essential python-dev git scons swig
sudo apt-get install -y libffi-dev python-dev libevent-dev
sudo install sounddevice

Install:
sudo apt-get install pavucontrol

Start:
pactl load-module module-loopback latency_msec=1

Stop:
pactl unload-module module-loopback

3. To copy test script files and bin files
a. To copy test script files into the home folder:
giga_ad27qd_audio_route.sh
giga_ad27qd_usb_check.sh
fireplace.sh
NOTE:
After copying these files into the home folder, you should use chmod +x to make them executable files. 

b. To prepare 4 USB drives with the following test bin files
USB20A.bin
USB20B.bin
USB30A.bin
USB30B.bin

NOTE:
The volume name of USB drive should be modified according to the name of test bin file. 
For example:
USB20A.bin should be put into the USB drive whose name is USB20A

c. To copy the test wave file into the folder ~/Music

4. To insert the GigaByte main board and then go to Sound setting for adjusting sound card parameters
a. To adjust Audio in and out parameters: output device, input device and gain level

