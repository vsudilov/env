export PS1="[\u@\h \d \A > \[$(tput sgr0)\]\[\033[38;5;2m\]\w\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"
export EDITOR=nano

_bre()
  {
      local cur=${COMP_WORDS[COMP_CWORD]}
      local IFS=$'\n'
      if [ -d bin ]; then #$COMP CWORD == 1 && [ -d bin ]; then
          COMPREPLY=($(compgen -o plusdirs -f -W "$(ls bin . ~)" -- $cur))
      else
          return 1
      fi
      return 0
  }
complete -o filenames -o bashdefault -F _bre bre -G


