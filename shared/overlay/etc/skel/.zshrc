#!/bin/zsh

# Settings
# ========
# Most settings are found on ~/.zprofile

# Compiler
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
export CFLAGS="-march=native -O2 -pipe"
export CXXFLAGS="${CFLAGS}"


# Waste time on a fortune cookie (most important part)
# ==============================
function cookie {
  if hash fortune 2>/dev/null; then
    if hash lolcat 2>/dev/null; then
      if hash unisay 2>/dev/null; then
        fortune | unisay -C | lolcat
      else
        fortune | lolcat
      fi
    else
      fortune
    fi
  else
    echo "Well, no cookies for you.."
  fi
}
cookie


# Load the awesomeness
# ====================
function safe_source {
  if [[ -s $1 ]]; then
    source $1
  fi
}

# Source prezto
safe_source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Source more stuff
# Prefeer these files for aliases, functions and path setup
safe_source "${ZDOTDIR:-$HOME}/.zpath"
safe_source "${ZDOTDIR:-$HOME}/.zaliases"
safe_source "${ZDOTDIR:-$HOME}/.zfunctions"

unset -f safe_source


# Null
# ====
# Everything below here should be reviewed, as it was probably added by scripts.

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
