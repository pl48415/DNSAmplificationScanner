#!/bin/bash
while read p; do

t=0
for i in 1 2 3
do 
result=$(timeout 1s dig any isc.org @$p | grep rcvd | grep -o '[0-9]*' )
 result=$((result+0))
 t=$(( $t + $result ))
 done
result=$(($t / 3))
  
if [ $result -ge 3000 ]; then
timeout 1.5s ping $p > exceed.temp
cat exceed.temp | grep -q "time="
if [ $? -eq 0 ]; then  
timeout 1s ping $p | sed -u 's/.*time=//' > ping.temp
sed -i '1d' ping.temp
sed -i 's/\..*/ /' ping.temp
  cat ping.temp | sed -u 's/ ms//' > ping2.temp
   s=0
   j=0
   while read k; do
    s=$(($k + $s ))
    j=$(( j + 1 ))
    done <ping2.temp
   if [ $j -ge 1  ]; then
    v=$(($s / $j))

   echo "$p -- $result  $v ms "  >> servers.txt
   fi
 fi
 fi
done <lista
rm ping.temp
rm ping2.temp
