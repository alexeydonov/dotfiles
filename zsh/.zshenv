if [[ $(uname) == "Darwin" ]]; then
  export LANG=en_US.UTF-8
  export LC_CTYPE=en_US.UTF-8
fi
export EDITOR="/usr/bin/editor"
export XDG_CONFIG_HOME="$HOME/.config"
