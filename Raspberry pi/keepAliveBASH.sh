#!/bin/bash

SQL_HOST="200.126.14.234"
SQL_USER="gustavocastillo"
SQL_PASSWORD="temp123"
SQL_DATABASE="keepAlive"
SQL_PORT="5006"
SQL_ARGS="-h $SQL_HOST --port=5006 -u $SQL_USER --password=$SQL_PASSWORD -D keepAlive -s -e"
declare -a StringArray=("200.126.14.228" "200.126.14.229" "200.126.14.230" "200.126.14.231" "200.126.14.232" "200.126.14.233" "200.126.14.234" "200.126.14.235")
declare -a distros=("")

while :
do
for val in ${StringArray[@]};
do
  echo $val
  if ping -c 1 $val &> /dev/null
  then
    echo "Encendido"
    distros=(Encendido "${distros[@]}")
  else
    echo "Apagado"
    distros=(Apagado "${distros[@]}")
  fi
done
echo ${distros[@]}
mysql $SQL_ARGS "INSERT INTO pruebaestado (servidor_1, servidor_2, servidor_3, servidor_4, servidor_5, servidor_6, servidor_7, servidor_8, fecha) VALUES ( '${distros[0]}', '${distros[1]}', '${distros[2]}','${distros[3]}','${distros[4]}','${distros[5]}','${distros[6]}','${distros[7]}', now() );"
sleep 30
distros=("")
done
