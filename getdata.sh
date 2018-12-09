
w1path="/sys/bus/w1/devices"

for dev in $(ls $w1path)
do
	file=${w1path}/${dev}/w1_slave
	if [ -f $file ];
	then
		value=$(cat $file | grep -oe 't=\(.*\)$' | cut -d'=' -f 2)
		sqlite3 temperature.db "insert into sensordata(sensor_id,value) values('${dev}','${value}')"
	fi
	#/sys/bus/w1/devices/28-000004ce9f9c/w1_slave
done

