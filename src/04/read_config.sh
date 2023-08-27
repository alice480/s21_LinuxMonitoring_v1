#!/bin/bash

read_config() {
  source ./conf/config.conf
  export param_text=$column1_font_color
  export param_bg=$column1_background
  export value_text=$column2_font_color
  export value_bg=$column2_background
  export default_flag=
}

read_default_config() {
  source ./conf/default_config.conf
  if [[ -z "$param_text" ]] || [[ -z "$param_bg" ]] || [[ -z "$value_text" ]] || [[ -z "$value_bg" ]]; 
  then
    export param_text=$column1_font_color;
    export param_bg=$column1_background;
    export value_text=$column2_font_color;
    export value_bg=$column2_background;
    export default_flag="default";
  fi
}