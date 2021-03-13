#!/bin/bash

while :
do
  echo "$(date) @ $(hostname)"
  echo "Performing new stress testing cycle..."
  stress --cpu 20 --io 20 --vm 6 --vm-bytes 25M --timeout 120s 
  cpu=$(</sys/class/thermal/thermal_zone0/temp)
  echo "-------------------------------------------"
  echo "GPU => $(/opt/vc/bin/vcgencmd measure_temp)"
  echo "CPU => $((cpu/1000))'C"
  echo "Timeout..."
  sleep 3
done
