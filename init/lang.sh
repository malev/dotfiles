# Volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# GoEnv
export GOENV_SHELL=zsh
export GOENV_ROOT="$HOME/.goenv"
if [ "${PATH#*$GOENV_ROOT/shims}" = "${PATH}" ]; then
  export PATH="$PATH:$GOENV_ROOT/shims"
fi
source '/opt/homebrew/Cellar/goenv/2.2.0/libexec/../completions/goenv.zsh'
command goenv rehash 2>/dev/null
goenv() {
  local command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(goenv "sh-$command" "$@")";;
  *)
    command goenv "$command" "$@";;
  esac
}
goenv rehash --only-manage-paths

# Java
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/Users/malev/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME
source '/opt/homebrew/Cellar/jenv/0.5.7/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval "`jenv \"sh-$command\" \"$@\"`";;
  *)
    command jenv "$command" "$@";;
  esac
}

# Python
source "$HOME/.rye/env"

# Ruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
chruby ruby-3.3.2

# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
