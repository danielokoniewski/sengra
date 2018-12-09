sqlite3 temperature.db "select sensor_id,measuretime,cast(value as decimal)/1000.0 from sensordata where measuretime >= date ('now','-7 days') order by 1,measuretime asc" > /home/pi/temperaturdata/lastweek.csv

#sqlite3 temperature.db "select sensor_id,cast(value as decimal)/1000.0,row_number() over (partition by sensor_id order by measuretime desc) rn from sensordata order by 1 "
sqlite3 temperature.db < plotselect.sql
gnuplot temperatureplot.gnuplot 
