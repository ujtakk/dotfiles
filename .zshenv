###########################################################
# environment
###########################################################

export USER=$USERNAME
export HOSTNAME=$HOST
export PAGER=less
export EDITOR=vim
export TERMINAL=urxvt
export BROWSER=google-chrome
# export LANG=C
# export LC_ALL=C
export LANG=C.utf8
export LC_ALL=C.utf8
# export LANG=ja_JP.UTF-8
# export LC_ALL=ja_JP.UTF-8
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

# hist
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Diff from 666
umask 022

### prompt
setopt prompt_subst
PROMPTCOLOR=31

# ターム内のプロンプトの設定
autoload -U colors && colors

PROMPT='%{$fg[blue]%}%n@%M:%4~%{$reset_color%}
%(!.#.$) '
export VIRTUAL_ENV_DISABLE_PROMPT=1
