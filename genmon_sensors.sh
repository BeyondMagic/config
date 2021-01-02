sensors | grep Temperature | sed "s/CPU Temperature:    +//g" | sed -e "s/(high = +60.0°C, crit = +95.0°C)//g"
