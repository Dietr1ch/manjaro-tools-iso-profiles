#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#


# Browser
# =======
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi


# Editors
# =======
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'


# History settings
# ================
export HIST_IGNORE_SPACE=":P"
export HISTIGNORE=c:b:cd:x:exit:history:fc
export HISTIGNORE=$HISTIGNORE:fortune:lolcat


# Language
# ========
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
if [[ -z "$LC_CTYPE" ]]; then
  export LC_CTYPE="utf-8"
fi
if [[ -z "$LC_ALL" ]]; then
  export LC_ALL="en_US.utf8"
fi


# Less
# ====
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi


# Temporary Files
# ===============
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi
