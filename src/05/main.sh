#!/bin/bash

source "directory_inform.sh"

START_TIME=$(date +%s%N | cut -b1-13)

if [ $# -eq 1 ]
then
  REGEX="/$"
  if [[ $1 =~ $REGEX ]]
    then 
      if test -e $1;
        then
          (folders_number $1)
          (top_5_directories $1)
          (total_files_number $1)
          (detailed_files_statistics $1)
          (top_10_files $1)
          (top_10_exe_files $1)
        else echo "ERROR: There is no such directory"
      fi
    else
      echo "ERROR: at the end should be used /";
  fi
else
  echo "ERROR: Incorrect number of parameters"
fi

END_TIME=$(date +%s%N | cut -b1-13)
TIME_DELTA=$(( $END_TIME - $START_TIME ))
echo "Script execution time (in milliseconds) = $TIME_DELTA"