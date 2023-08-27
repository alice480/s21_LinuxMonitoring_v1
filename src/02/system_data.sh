#!/bin/bash

get_system_data() {
  TZ=$(cat /etc/timezone)
  OS_NAME=$(grep -E '^NAME' /etc/os-release | sed 's/NAME=//' | sed 's/"//g')
  OS_VERSION=$(grep "VERSION=" /etc/os-release | cut -c10- | sed 's/\(([a-zA-Z ]*)*\)"//g' | sed 's/ $//')
  DATE=$(date +"%d %B %Y %T")
  UPTIME=$(uptime -p | cut -c4-)
  UPTIME_SEC=$(awk '{print $1}' /proc/uptime)
  IP=$(hostname -I | awk '{print $1}')
  MASK=$(ifconfig | grep -m1 netmask | awk '{print $4}')
  GATEWAY=$(ip route | grep default | awk '{print $3}')
  RAM_TOTAL=$(free | grep -P 'Mem|Память' | awk '{printf "%.3f GB", $2/1024/1024}')
  RAM_USED=$(free | grep -P 'Mem|Память' | awk '{printf "%.3f GB", $3/1024/1024}')
  RAM_FREE=$(free | grep -P 'Mem|Память' | awk '{printf "%.3f GB", $4/1024/1024}')
  SPACE_ROOT=$(df | grep '/$' | awk '{printf "%.2f MB", $2/1024}')
  SPACE_ROOT_USED=$(df | grep '/$' | awk '{printf "%.2f MB", $3/1024}')
  SPACE_ROOT_FREE=$(df | grep '/$' | awk '{printf "%.2f MB", $4/1024}')
}

print_system_data() {
  echo "HOSTNAME = $HOSTNAME"
  echo "TIMEZONE = $TZ"
  echo "USER = $USER"
  echo "OS = $OS_NAME $OS_VERSION"
  echo "DATE = $DATE"
  echo "UPTIME = $UPTIME"
  echo "UPTIME_SEC = $UPTIME_SEC"
  echo "IP = $IP"
  echo "MASK = $MASK"
  echo "GATEWAY = $GATEWAY"
  echo "RAM_TOTAL = $RAM_TOTAL"
  echo "RAM_USED = $RAM_USED"
  echo "RAM_FREE = $RAM_FREE"
  echo "SPACE_ROOT = $SPACE_ROOT"
  echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
  echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}

saving() {
  echo ; echo 'Write data to a file?'
  read -p 'To record use Y/y: ' answer
  if [[ "$answer" == "Y" ]] || [[ "$answer" == 'y' ]];
  then
    file_name=$(date +"%d_%m_%Y_%H_%M_%S")
    print_system_data > "$file_name.status"
  fi
}
