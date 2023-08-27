#!/bin/bash

source "check_params.sh"
source "system_data.sh"
source "read_config.sh"

print_color_scheme() {
  # 1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black
  colors=("white" "red" "green" "blue" "purple" "black")
  echo
  if [ ! -z "$default_flag" ]
  then
    echo "Column 1 background = $default_flag (${colors[(($param_bg-1))]})"
    echo "Column 1 font color = $default_flag (${colors[(($param_text-1))]})"
    echo "Column 2 background = $default_flag (${colors[(($value_bg-1))]})"
    echo "Column 2 font color = $default_flag (${colors[(($value_text-1))]})"
  else
    echo "Column 1 background = $param_bg (${colors[(($param_bg-1))]})"
    echo "Column 1 font color = $param_text (${colors[(($param_text-1))]})"
    echo "Column 2 background = $value_bg (${colors[(($value_bg-1))]})"
    echo "Column 2 font color = $value_text (${colors[(($value_text-1))]})"
  fi
}

main() {
  read_config
  read_default_config
  column1=$(check_match $param_bg $param_text)
  column2=$(check_match $value_bg $value_text)
  if [ $column1 -eq 0 ] && [ $column2 -eq 0 ];
    then
      (check_values $param_bg $param_text $value_bg $value_text)
      if [ $? -eq 1 ]
        then
          get_system_data
          (print_system_data $param_bg $param_text $value_bg $value_text)
        else
          echo "ERROR: Parameters do not correspond to valid values"
      fi
    else
      echo "ERROR: The same values for text and background have been entered"
      echo "You can run the script again"
      exit
  fi
  print_color_scheme
}

main