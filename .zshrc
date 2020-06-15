if [ -f ~/.zshrc.local ];
then
  . ~/.zshrc.local
fi

# private clients env
case $OSTYPE in
  darwin* )
    export PATH=/usr/local/bin:$PATH
    export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH

    export CPATH=/usr/include:$CPATH

    export LOCAL_DIR=/Users/$USER/local
    ;;
  linux* )
    export LOCAL_DIR=/home/$USER/local
    ;;
esac

export PATH=$LOCAL_DIR/bin:$PATH
export LIBRARY_PATH=$LOCAL_DIR/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=$LOCAL_DIR/lib:$LD_LIBRARY_PATH
export CPATH=$LOCAL_DIR/include:$CPATH
export CMAKE_MODULE_PATH=$LOCAL_DIR/lib/cmake:$CMAKE_MODULE_PATH
export PKG_CONFIG_PATH=$LOCAL_DIR/lib/pkgconfig

# opam configuration
test -r ~/.opam/opam-init/init.zsh && . ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
source $LOCAL_DIR/python-dev/bin/activate
export GOPATH=$LOCAL_DIR/go-dev


###########################################################
# options
###########################################################

# Disable beeps
setopt no_beep

# 親プロセスが死んでも子プロセスが死なない
setopt nohup

# Share zsh histories
setopt share_history
# コマンドの開始時間，経過時間をヒストリに保存
setopt extended_history
# 直前と同じコマンドを入力した場合，ヒストリに入れない
setopt hist_ignore_dups
# コマンドの不要な空白を削除してヒストリに登録
setopt hist_reduce_blanks
# スペースで始まるコマンドをヒストリに登録しない
setopt hist_ignore_space
# historyコマンドをヒストリに登録しない
setopt hist_no_store

# Enable spellcheck
setopt correct
setopt correct_all
# Enable extended glob
setopt extended_glob
# Compact completion
setopt list_packed
setopt auto_cd
setopt auto_pushd
setopt pushd_silent
setopt pushd_ignore_dups

# 日本語のファイル名も補完リストで表示
setopt print_eight_bit

# rm で * を使う際に聞き返してこない
setopt rm_star_silent

# ファイル名中の数字を数字としてソート
setopt numeric_glob_sort

## TAB で順に補完候補を切り替える
## setopt auto_menu 
## TAB で順に補完候補を切り替えない
setopt noautomenu

setopt sh_word_split
setopt auto_param_keys
setopt no_list_ambiguous

[[ $EMACS = t ]] && unsetopt zle


###########################################################
# colors
###########################################################

# if ( which dircolors >& /dev/null ); then
#   if [ -f ~/.dircolors ] ; then
#     eval `dircolors --sh ~/.dircolors`
#   fi
#   export LS_COLORS="${LS_COLORS}:*~=01;42:*#=01;42:*%=01;42"
# else
#
#   export LS_COLORS="\
#   *~=32;1:*#=32;1:*%=32;1:\
#   *README=31;4:*eadme=31;4:\
#   *.c=31:*.cc=31:*.cpp=31:*.C=31:*.cxx=31:*.h=31:*.o=32:*Makefile=31;43:\
#   *.html=31:*.htm=31:*.shtml=31:*.tex=31:*.lyx=31:*.mgp=31:*.pl=31:*.for=31:\
#   *.tar=01;31:*.tgz=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.rpm=01;31:*.lzh=01;31:*.zip=01;31:\
#   *.jpg=35:*.jpeg=35:*.gif=35:*.bmp=35:*.JPG=35:*.JPEG=35:*.GIF=35:*.BMP=35:\
#   *.eps=35:*.ppm=35:*.xbm=35:*.xpm=35:*.tif=35:\
#   *.mpg=01;37:*.mpeg=01;37:*.avi=01;37:*.MPG=01;37:*.MPEG=01;37:*.AVI=01;37:\
#   or=31;7"
#
# fi

# LS_COLORS='no=00;38;5;244:rs=0:di=00;38;5;33:ln=00;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:ex=00;38;5;64:*.tar=00;38;5;61:*.tgz=00;38;5;61:*.arj=00;38;5;61:*.taz=00;38;5;61:*.lzh=00;38;5;61:*.lzma=00;38;5;61:*.tlz=00;38;5;61:*.txz=00;38;5;61:*.zip=00;38;5;61:*.z=00;38;5;61:*.Z=00;38;5;61:*.dz=00;38;5;61:*.gz=00;38;5;61:*.lz=00;38;5;61:*.xz=00;38;5;61:*.bz2=00;38;5;61:*.bz=00;38;5;61:*.tbz=00;38;5;61:*.tbz2=00;38;5;61:*.tz=00;38;5;61:*.deb=00;38;5;61:*.rpm=00;38;5;61:*.jar=00;38;5;61:*.rar=00;38;5;61:*.ace=00;38;5;61:*.zoo=00;38;5;61:*.cpio=00;38;5;61:*.7z=00;38;5;61:*.rz=00;38;5;61:*.apk=00;38;5;61:*.gem=00;38;5;61:*.jpg=00;38;5;136:*.JPG=00;38;5;136:*.jpeg=00;38;5;136:*.gif=00;38;5;136:*.bmp=00;38;5;136:*.pbm=00;38;5;136:*.pgm=00;38;5;136:*.ppm=00;38;5;136:*.tga=00;38;5;136:*.xbm=00;38;5;136:*.xpm=00;38;5;136:*.tif=00;38;5;136:*.tiff=00;38;5;136:*.png=00;38;5;136:*.PNG=00;38;5;136:*.svg=00;38;5;136:*.svgz=00;38;5;136:*.mng=00;38;5;136:*.pcx=00;38;5;136:*.dl=00;38;5;136:*.xcf=00;38;5;136:*.xwd=00;38;5;136:*.yuv=00;38;5;136:*.cgm=00;38;5;136:*.emf=00;38;5;136:*.eps=00;38;5;136:*.CR2=00;38;5;136:*.ico=00;38;5;136:*.tex=00;38;5;245:*.rdf=00;38;5;245:*.owl=00;38;5;245:*.n3=00;38;5;245:*.ttl=00;38;5;245:*.nt=00;38;5;245:*.torrent=00;38;5;245:*.xml=00;38;5;245:*Makefile=00;38;5;245:*Rakefile=00;38;5;245:*Dockerfile=00;38;5;245:*build.xml=00;38;5;245:*rc=00;38;5;245:*1=00;38;5;245:*.nfo=00;38;5;245:*README=00;38;5;245:*README.txt=00;38;5;245:*readme.txt=00;38;5;245:*.md=00;38;5;245:*README.markdown=00;38;5;245:*.ini=00;38;5;245:*.yml=00;38;5;245:*.cfg=00;38;5;245:*.conf=00;38;5;245:*.h=00;38;5;245:*.hpp=00;38;5;245:*.c=00;38;5;245:*.cpp=00;38;5;245:*.cxx=00;38;5;245:*.cc=00;38;5;245:*.objc=00;38;5;245:*.sqlite=00;38;5;245:*.go=00;38;5;245:*.sql=00;38;5;245:*.csv=00;38;5;245:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.lof=00;38;5;240:*.lol=00;38;5;240:*.lot=00;38;5;240:*.out=00;38;5;240:*.toc=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:*.aac=00;38;5;166:*.au=00;38;5;166:*.flac=00;38;5;166:*.mid=00;38;5;166:*.midi=00;38;5;166:*.mka=00;38;5;166:*.mp3=00;38;5;166:*.mpc=00;38;5;166:*.ogg=00;38;5;166:*.opus=00;38;5;166:*.ra=00;38;5;166:*.wav=00;38;5;166:*.m4a=00;38;5;166:*.axa=00;38;5;166:*.oga=00;38;5;166:*.spx=00;38;5;166:*.xspf=00;38;5;166:*.mov=00;38;5;166:*.MOV=00;38;5;166:*.mpg=00;38;5;166:*.mpeg=00;38;5;166:*.m2v=00;38;5;166:*.mkv=00;38;5;166:*.ogm=00;38;5;166:*.mp4=00;38;5;166:*.m4v=00;38;5;166:*.mp4v=00;38;5;166:*.vob=00;38;5;166:*.qt=00;38;5;166:*.nuv=00;38;5;166:*.wmv=00;38;5;166:*.asf=00;38;5;166:*.rm=00;38;5;166:*.rmvb=00;38;5;166:*.flc=00;38;5;166:*.avi=00;38;5;166:*.fli=00;38;5;166:*.flv=00;38;5;166:*.gl=00;38;5;166:*.m2ts=00;38;5;166:*.divx=00;38;5;166:*.webm=00;38;5;166:*.axv=00;38;5;166:*.anx=00;38;5;166:*.ogv=00;38;5;166:*.ogx=00;38;5;166:';
# export LS_COLORS

LS_COLORS='no=00:fi=00:di=34:ow=34;40:ln=35:pi=30;44:so=35;44:do=35;44:bd=33;44:cd=37;44:or=05;37;41:mi=05;37;41:ex=01;31:*.cmd=01;31:*.exe=01;31:*.com=01;31:*.bat=01;31:*.reg=01;31:*.app=01;31:*.txt=32:*.org=32:*.md=32:*.mkd=32:*.h=32:*.hpp=32:*.c=32:*.C=32:*.cc=32:*.cpp=32:*.cxx=32:*.objc=32:*.cl=32:*.sh=32:*.bash=32:*.csh=32:*.zsh=32:*.el=32:*.vim=32:*.java=32:*.pl=32:*.pm=32:*.py=32:*.rb=32:*.hs=32:*.php=32:*.htm=32:*.html=32:*.shtml=32:*.erb=32:*.haml=32:*.xml=32:*.rdf=32:*.css=32:*.sass=32:*.scss=32:*.less=32:*.js=32:*.coffee=32:*.man=32:*.0=32:*.1=32:*.2=32:*.3=32:*.4=32:*.5=32:*.6=32:*.7=32:*.8=32:*.9=32:*.l=32:*.n=32:*.p=32:*.pod=32:*.tex=32:*.go=32:*.sql=32:*.csv=32:*.bmp=33:*.cgm=33:*.dl=33:*.dvi=33:*.emf=33:*.eps=33:*.gif=33:*.jpeg=33:*.jpg=33:*.JPG=33:*.mng=33:*.pbm=33:*.pcx=33:*.pdf=33:*.pgm=33:*.png=33:*.PNG=33:*.ppm=33:*.pps=33:*.ppsx=33:*.ps=33:*.svg=33:*.svgz=33:*.tga=33:*.tif=33:*.tiff=33:*.xbm=33:*.xcf=33:*.xpm=33:*.xwd=33:*.xwd=33:*.yuv=33:*.aac=33:*.au=33:*.flac=33:*.m4a=33:*.mid=33:*.midi=33:*.mka=33:*.mp3=33:*.mpa=33:*.mpeg=33:*.mpg=33:*.ogg=33:*.opus=33:*.ra=33:*.wav=33:*.anx=33:*.asf=33:*.avi=33:*.axv=33:*.flc=33:*.fli=33:*.flv=33:*.gl=33:*.m2v=33:*.m4v=33:*.mkv=33:*.mov=33:*.MOV=33:*.mp4=33:*.mp4v=33:*.mpeg=33:*.mpg=33:*.nuv=33:*.ogm=33:*.ogv=33:*.ogx=33:*.qt=33:*.rm=33:*.rmvb=33:*.swf=33:*.vob=33:*.webm=33:*.wmv=33:*.doc=31:*.docx=31:*.rtf=31:*.odt=31:*.dot=31:*.dotx=31:*.ott=31:*.xls=31:*.xlsx=31:*.ods=31:*.ots=31:*.ppt=31:*.pptx=31:*.odp=31:*.otp=31:*.fla=31:*.psd=31:*.7z=1;35:*.apk=1;35:*.arj=1;35:*.bin=1;35:*.bz=1;35:*.bz2=1;35:*.cab=1;35:*.deb=1;35:*.dmg=1;35:*.gem=1;35:*.gz=1;35:*.iso=1;35:*.jar=1;35:*.msi=1;35:*.rar=1;35:*.rpm=1;35:*.tar=1;35:*.tbz=1;35:*.tbz2=1;35:*.tgz=1;35:*.tx=1;35:*.war=1;35:*.xpi=1;35:*.xz=1;35:*.z=1;35:*.Z=1;35:*.zip=1;35:*.ANSI-30-black=30:*.ANSI-01;30-brblack=01;30:*.ANSI-31-red=31:*.ANSI-01;31-brred=01;31:*.ANSI-32-green=32:*.ANSI-01;32-brgreen=01;32:*.ANSI-33-yellow=33:*.ANSI-01;33-bryellow=01;33:*.ANSI-34-blue=34:*.ANSI-01;34-brblue=01;34:*.ANSI-35-magenta=35:*.ANSI-01;35-brmagenta=01;35:*.ANSI-36-cyan=36:*.ANSI-01;36-brcyan=01;36:*.ANSI-37-white=37:*.ANSI-01;37-brwhite=01;37:*.log=01;32:*~=01;32:*#=01;32:*.bak=01;33:*.BAK=01;33:*.old=01;33:*.OLD=01;33:*.org_archive=01;33:*.off=01;33:*.OFF=01;33:*.dist=01;33:*.DIST=01;33:*.orig=01;33:*.ORIG=01;33:*.swp=01;33:*.swo=01;33:*,v=01;33:*.gpg=34:*.gpg=34:*.pgp=34:*.asc=34:*.3des=34:*.aes=34:*.enc=34:*.sqlite=34:';
export LS_COLORS

# use prompt colors feature
autoload -U colors
colors

# Color settings for zsh complete candidates
export ZLS_COLORS=$LS_COLORS
zmodload -ui complist

alias l='ls -a --color=auto'
alias ls='ls -F --color=auto'
alias ll='ls -l -h --color=auto'
alias la='ls -la -h --color=auto'
alias lso='ls -ltrc --color=auto'
alias lao='ls -latrc --color=auto'

#case $OSTYPE in
#  darwin*)
#    alias l='ls -a -G'
#    alias ls='ls -F -G'
#    alias la='ls -la -h -G'
#  ;;
#  linux*)
#    alias l='ls -a --color=auto'
#    alias ls='ls -F --color=auto'
#    alias la='ls -la -h --color=auto'
#  ;;
#esac


###########################################################
# completion
###########################################################

#zstyle ':completion:*:complete:ssh:*:hosts' hosts $hosts
# The following lines were added by compinstall

#zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completer _oldlist  _expand _complete _ignored _match _prefix

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' match-original both
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} m:{a-zA-Z}={A-Za-z}' 'm:{a-z}={A-Z} m:{a-zA-Z}={A-Za-z}' 'm:{a-z}={A-Z} m:{a-zA-Z}={A-Za-z}' 'm:{a-z}={A-Z} m:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' old-list _complete _approximate _correct _match _expand
zstyle ':completion:*' original true
zstyle :compinstall filename '~/.zshrc'
#zstyle ':completion:*:default' menu select=1

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完機能が強力になる
autoload -Uz compinit
compinit


###########################################################
# bindkey
###########################################################

# bindkey -v       # vi key bindings
bindkey -e         # emacs key bindings

## Bindkey you may think it's usefull
bindkey ' ' magic-space  # also do history expansino on space
bindkey -s "^xs" '\C-e"\C-asu -c "'
#bindkey -s "^xd" "$(date '+-%d_%b')"
bindkey -s "^xd" "$(date '+-%Y%m%d')"
#bindkey -s "^xf" "$(date '+-%D'|sed 's|/||g')"
bindkey -s "^xp" "\$(pwd\)/"
bindkey -s "^xw" "\C-a \$(which \C-e\)\C-a"

# ctrl+j で コマンドの途中からヒストリを呼び出す
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^J" history-beginning-search-backward-end


###########################################################
# alias
###########################################################

# Global aliases
# {{{
alias -g A="| awk"
alias -g S="| sed"
alias -g G="| grep"
alias -g L="| less"
alias -g W="| wc"
less_with_unbuffer () {
    unbuffer "$@" |& less -SR
}
alias UL=less_with_unbuffer
alias AG="less_with_unbuffer ag"

alias -g H="| head -n "
alias -g T="| tail -n "
function head-tail()
{
  head -n $3 $1 | tail -n $(($3 - $2 + 1))
}
alias -g HT="| head-tail - "

alias -g X="| xargs"
# xargsによるお手軽並列処理
function xargs-pallalel() {
  xargs -P $1 -I {} -t zsh -c '{}'
}
alias -g XP="| xargs-pallalel "

# C で標準出力をクリップボードにコピーする
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1; then
  # Mac
  alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1; then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1; then
  # Cygwin
  alias -g C='| putclip'
fi
# }}}

# Syntax aliases
# script -> interpreter
# compile lang -> editor
# text -> editor
# {{{
# alias -s c=vim
# alias -s h=vim
# alias -s cpp=vim
# alias -s hpp=vim
# alias -s java=vim
# alias -s txt=vim
# alias -s tex=vim
#
# alias -s py=python3
# alias -s sh=zsh
# }}}

# Common aliases
alias h='history -20'

alias du='du -h'
alias dus='du -sh * | sort -h'
alias psp='ps aux | grep'

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -i'
alias mkdir='nocorrect mkdir -m 755'
alias rm='rm -i'

# Application
alias gpp="g++"
alias tmux="tmux -2"
# alias tmux="TERM=xterm-256color tmux"
alias R="R --no-save"
alias vi="/usr/bin/vi -v -u NONE"
alias rsync="rsync -avhz --progress --partial --no-inc-recursive"
# alias grep="grep -n --color=auto"
# alias egrep="egrep -n --color=auto"
# alias diff="diff -u"
alias emacs="emacs --insecure"
if type nvim >/dev/null 2>&1; then
  alias vim="nvim"
fi
alias ocaml="rlwrap ocaml"
alias ghc="stack ghc --"
alias ghci="stack ghci"
alias runghc="stack runghc --"
alias runhaskell="stack runghc --"
alias vcs="vcs -full64"

alias zshrc="${EDITOR} ~/.zshrc"
alias zshenv="${EDITOR} ~/.zshenv"
alias vimrc="${EDITOR} ~/.vim/vimrc"
alias dein="${EDITOR} -O ~/.vim/rc/dein.toml ~/.vim/rc/dein_lazy.toml"
alias Init="source ~/.zshrc"
alias save="(cd ~/dotfiles; git commit -am 'AUTO COMMIT'; git push origin master)"
alias load="(cd ~/dotfiles; git pull)"
# alias vivado="LC_ALL=C vivado -nojournal -nolog"
alias minicom="LC_ALL=C minicom"
alias sl="ls"

function svgpdf() {
  DISPLAY= LC_ALL=C inkscape -z -D -A `echo $1 | cut -d. -f1`.pdf $1
}

function svgpng() {
  DISPLAY= LC_ALL=C inkscape -z -D -e `echo $1 | cut -d. -f1`.png $1
}


# env-dep. aliases
case $OSTYPE in
  darwin* )
    alias tunnel="ssh -f -N tunnel"
    ;;
  linux* )
    alias githist="git log --pretty=format:"%h %s" --graph"

    alias chr="google-chrome"
    alias ff="firefox"
    alias am="acroread main.pdf &"
    alias xm='xpdf main.pdf &'
    alias lock="i3lock -c 000000"

    alias open="xdg-open"

    function pict() {
      xwd | convert - $1
    }
    ;;
esac

unset SSH_ASKPASS

