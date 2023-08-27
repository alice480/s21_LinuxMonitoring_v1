#!/bin/bash

# not equal - 0
# equal - 1
function check_match {
    if [ $1 -eq $2 ]
    then result=1
    else result=0
    fi
    echo $(( $result ))
}

function check_range {
    if [ $1 -ge 1 ] && [ $1 -le 6 ]
    then return 1
    else return 0
    fi
}

function check_values {
    result=1

    check_range $1
    result=($result*$?)

    check_range $2
    result=($result*$?)
    
    check_range $3
    result=($result*$?)

    check_range $4
    result=($result*$?)

    return $(( $result ))
}