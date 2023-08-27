#!/bin/bash

source "colors.sh"

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

function print_system_data {
    PARAM_BG=$(get_background_color_code $1)
    PARAM_TXT=$(get_text_color_code $2)
    VAL_BG=$(get_background_color_code $3)
    VAL_TXT=$(get_text_color_code $4)
    END="\033[0m"
    
    echo -e "${PARAM_TXT}${PARAM_BG}HOSTNAME${END} = ${VAL_TXT}${VAL_BG}$HOSTNAME${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}TIMEZONE${END} = ${VAL_TXT}${VAL_BG}$TZ${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}USER${END} = ${VAL_TXT}${VAL_BG}$USER${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}OS${END} = ${VAL_TXT}${VAL_BG}$OS_NAME $OS_VERSION${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}DATE${END} = ${VAL_TXT}${VAL_BG}$DATE${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}UPTIME${END} = ${VAL_TXT}${VAL_BG}$UPTIME${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}IP${END} = ${VAL_TXT}${VAL_BG}$IP${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}MASK${END} = ${VAL_TXT}${VAL_BG}$MASK${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}GATEWAY${END} = ${VAL_TXT}${VAL_BG}$GATEWAY${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}RAM_TOTAL${END} = ${VAL_TXT}${VAL_BG}$RAM_TOTAL${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}RAM_USED${END} = ${VAL_TXT}${VAL_BG}$RAM_USED${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}RAM_FREE${END} = ${VAL_TXT}${VAL_BG}$RAM_FREE${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}SPACE_ROOT${END} = ${VAL_TXT}${VAL_BG}$SPACE_ROOT${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}SPACE_ROOT_USED${END} = ${VAL_TXT}${VAL_BG}$SPACE_ROOT_USED${END}"
    echo -e "${PARAM_TXT}${PARAM_BG}SPACE_ROOT_FREE${END} = ${VAL_TXT}${VAL_BG}$SPACE_ROOT_FREE${END}"
}
