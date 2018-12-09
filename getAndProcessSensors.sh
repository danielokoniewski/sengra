#!/bin/bash


#get data from sensors
bash /home/pi/getdata.sh 
# process data
bash /home/pi/processSensorData.sh 
# publish
bash /home/pi/putfile.sh
