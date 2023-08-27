#!/bin/bash

path=$1

function folders_number {
  FOLDERS=$(find $path* -type d | wc -l)
  echo "Total number of folders (including all nested ones) = $FOLDERS"
}

function top_5_directories {
  echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
  du -BM $path | sort -nr | sed -n '1,5p' | awk '{print NR" - " $2 "/, " $1"B"}'
  TOTAL_DNUMBER=$(find $path -type d | wc -l)
  if [ $TOTAL_DNUMBER -gt 5 ]
  then
    echo "etc up to $TOTAL_DNUMBER"
  fi
}

function total_files_number {
  TOTAL_FNUMBER=$(ls -laR $path | grep "^-" | wc | awk '{print $1}')
  echo "Total number of files = $TOTAL_FNUMBER"
}

function detailed_files_statistics {
  CONF_FILES=$(find $path -type f -name \*.conf | wc -l)
  TEXT_FILES=$(find $path -type f -name \*.txt | wc -l)
  EXE_FILES=$(find $path -type f -name \*.exe | wc -l)
  LOG_FILES=$(find $path -type f -name \*.log | wc -l)
  ARCH_FILES=$(find $path -type f | grep "\.(zip|rar|gz|tar|7z)" | wc -l)
  LINKS=$(find $path -type l | wc -l)

  echo "Number of:"
  echo "Configuration files (with the .conf extension) = $CONF_FILES"
  echo "Text files = $TEXT_FILES"
  echo "Log files (with the extension .log) = $LOG_FILES"
  echo "Archive files = $ARCH_FILES"
  echo "Symbolic links = $LINKS"
}

function top_10_files {
  echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
  find $path -type f -exec du -BM {} + | sort -nr | head  | awk '{print $2", "$1", "$2}' | sed -e 's/, \(\.\|\/\).*\./ /' | awk '{print NR" - "$1" "$2"B, "$3}'
  TOTAL_FNUMBER=$(find $path -type f | wc -l)
  if [ $TOTAL_FNUMBER -gt 10 ]
    then echo "etc up to $TOTAL_FNUMBER"
  fi
}

function top_10_exe_files {
  echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
  EXE_FILES=$(find $path -type f -executable | sort -n | head)
  line=1
  for file in $EXE_FILES
  do
    size=$(du -BM $file | awk '{print $2", "$1"B"}')
    hash=$(md5sum $file | awk '{print $1}')
    echo "$line - $size, $hash"
    line=$(( $line + 1 ))
  done
  if [ $line -gt 10 ]
  then 
    TOTAL_ENUMBER=$(find $path -type f -executable | wc -l)
    echo "etc up to $TOTAL_ENUMBER"
  fi
}