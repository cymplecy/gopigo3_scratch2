#!/bin/bash
#Version 0.2 - add in & to allow simulatenous running of handler and Scratch
#Version 0.3 - change sp launches rsc.sb from "/home/pi/Documents/Scratch Projects"
#Version 0.4 - 20Mar13 meltwater - change to use provided name for home
#Version 1.0 - 29Oct13 sw - change to cd into simplesi_scratch_handler to run servods OK
#Version 1.1 - 26Jun17 sw - add in Scratch2GPIO
sudo pkill -f gopigo3scratch.py
sudo pkill -f wstosgh
sudo pkill -f gopigo3_power.py
scratch2 &
cd /home/pi/GoPiGo3/Software/Scratch
sudo rm /usr/lib/scratch2/scratch_extensions/piGPIOExtension.js
sudo cp /home/pi/GoPiGo3/Software/Scratch/DI_piGPIOExtension.js /usr/lib/scratch2/scratch_extensions/piGPIOExtension.js
sudo python /home/pi/GoPiGo3/Software/gopigo3_power.py &
sudo python GoPiGo3Scratch.py &
python wstosgh.py &
