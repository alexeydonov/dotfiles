typeset -U path
typeset -U fpath

# FPath setup
[[ -d $HOME/.local/share/zsh/site-functions ]] &&fpath+=($HOME/.local/share/zsh/site-functions)
[[ -d /opt/local/share/zsh/site-functions ]] && fpath+=(/opt/local/share/zsh/site-functions)
[[ -d /usr/share/zsh/site-functions ]] && fpath+=(/usr/share/zsh/site-functions)

# Path setup
[[ -d /opt/local/lib/ImageMagick7/bin ]] && path=(/opt/local/lib/ImageMagick7/bin $path)
[[ -d /opt/local/bin ]] && path=(/opt/local/bin $path)
[[ -d /opt/local/sbin ]] && path=(/opt/local/sbin $path)
[[ -d $HOME/.local/bin ]] && path=($HOME/.local/bin $path)

# Set up the prompt
autoload -Uz promptinit
promptinit

# Colors
export CLICOLOR=1
export GREP_OPTIONS="--colour"

# Aliases
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- --="cd --"

alias ls="eza --icons=auto --git --group --time-style=long-iso"
alias l="ls --long"
alias ll="l -a"
export EZA_CONFIG_DIR="$HOME/.config/eza"

if [ -t 1 ]; then
  if command -v bat >/dev/null 2>&1; then
    alias cat='bat --plain --paging=never'
  elif command -v batcat >/dev/null 2>&1; then
    alias cat='batcat --plain --paging=never'
  fi
fi
export BAT_THEME="Nord"

# Additional scripts, not tracked by dotbot!
if [[ -d $HOME/.zshrc.d ]]; then
  for rc in $HOME/.zshrc.d/*.zsh; do
    if [[ -f "$rc" ]]; then
      . "$rc"
    fi
  done
fi
unset rc

# Antidote
for candidate in \
  ~/.antidote/antidote.zsh \
  /usr/share/zsh-antidote/antidote.zsh
do
  if [[ -f "$candidate" ]]; then
    zstyle ':antidote:bundle' use-friendly-names 'yes'
    . "$candidate"
    antidote load
    break
  fi
done
unset candidate

# History keyboard shortcuts
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Something or other
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
bindkey '^[b'     backward-word     # Option+Left
bindkey '^[[1;3D' backward-word     # Alt+Left
bindkey '^[f'     forward-word      # Option+Right
bindkey '^[[1;3C' forward-word      # Alt+Right
bindkey '^[^[[D'  beginning-of-line # Ctrl+Option+Left
bindkey '^[^[[C'  end-of-line       # Ctrl+Option+Right

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Comletion
autoload -Uz compinit
compinit -C -d ~/.zcompdump
# zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
# _correct
# _approximate
# zstyle ':completion:*' format 'Completing %d'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' menu select=2
# if command -v dircolors >/dev/null 2>&1; then
#   eval "$(dircolors -b)"
# fi
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' list-colors ''
# zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}'
# zstyle ':completion:*' menu select=long
# zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
# zstyle ':completion:*' verbose true
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
# zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
setopt nocasematch
bindkey '^I' complete-word

# Docker
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcr="docker compose restart"
alias vdc="vi docker-compose.yml"
dl() { docker logs $1 }
de() { docker exec -it $1 sh }

compdef _docker de=docker-exec
compdef _docker dl=docker-logs

# Dotfiles repo check
DOTBOT_DIR="$HOME/.dotfiles"
if [[ -d "$DOTBOT_DIR/.git" ]]; then
  if [[ -n "$(git -C "$DOTBOT_DIR" status --porcelain 2>/dev/null)" ]]; then
    print -P "%F{yellow}⚠ dotfiles repo has uncommitted changes.%f"
  fi
fi

