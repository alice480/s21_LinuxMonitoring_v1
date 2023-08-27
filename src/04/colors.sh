#!/bin/bash

# 1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black
function get_text_color_code {
    if [ $1 -eq 1 ]; then code="\033[97m"
    elif [ $1 -eq 2 ]; then code="\033[91m"
    elif [ $1 -eq 3 ]; then code="\033[92m"
    elif [ $1 -eq 4 ]; then code="\033[94m"
    elif [ $1 -eq 5 ]; then code="\033[95m"
    else code="\033[30m"
    fi
    echo $code
}

function get_background_color_code {
    if [ $1 -eq 1 ]; then code="\033[107m"
    elif [ $1 -eq 2 ]; then code="\033[101m"
    elif [ $1 -eq 3 ]; then code="\033[102m"
    elif [ $1 -eq 4 ]; then code="\033[104m"
    elif [ $1 -eq 5 ]; then code="\033[105m"
    else code="\033[40m"
    fi
    echo $code
}
