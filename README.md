# sengra
used on rpi: gets temperature from w1-sensors, store in sqlite, print with gnuplot put to nextcloud

example: 
* http://www.netzmafia.de/skripten/hardware/RasPi/Projekt-Onewire/index.html
* https://de.pinout.xyz/pinout/1_wire

## Setup
* setup w1 usage
* setup sqlite db
* create cronjob
* edit getAndProcessSensors (putfile parameter)

## w1
```
sudo modprobe w1-gpio pullup=1
sudo modprobe w1-therm

sudo dtoverlay w1-gpio gpiopin=4 pullup=0
```

## sqlite
sqlite3 temperature.db < setup.sql

## cron
crontab -e

## logindata
