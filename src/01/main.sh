#!/bin/bash
REGEX="^[0-9]+$"
if [ ! -n "$1" ]
then
echo "ERROR: No parameters"
elif [[ $1 =~ $REGEX ]]
then
echo "ERROR: Invalid format"
else
echo $1
fi