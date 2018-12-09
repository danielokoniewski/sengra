set datafile separator ','
set style data lines
set key out center top
set key horiz
set term png

set xdata time
set timefmt "%Y-%m-%d %H:%M"
set format x "%m.%d %H:%M"

set xtics rotate
set yrange [15:45]
set grid y

set output "temperaturdata/temperatur.png"
plot \
 'temperaturdata/plotdata.csv' using 1:2 w lines t "Raum" ,\
 'temperaturdata/plotdata.csv' using 1:3 w lines t "Heizung" ,\
 'temperaturdata/plotdata.csv' using 1:4 w lines t "Baum"
