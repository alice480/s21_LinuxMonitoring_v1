#!/bin/bash

source "check_params.sh"
source "system_data.sh"

if [ $# -eq 4 ]
then
    column1=$(check_match $1 $2)
    column2=$(check_match $3 $4)
    if [ $column1 -eq 0 ] && [ $column2 -eq 0 ];
    then
        (check_values $1 $2 $3 $4)
        if [ $? -eq 1 ]
        then
            get_system_data
            (print_system_data $1 $2 $3 $4)

        else
            echo "ERROR: Parameters do not correspond to valid values"
        fi
    else
        echo "ERROR: The same values for text and background have been entered"
        echo "You can run the script again"
        exit
    fi
else
    echo "ERROR: Incorrect number of parameters"
fi