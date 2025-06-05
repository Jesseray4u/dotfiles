# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------------------------------- #
# ------->  ZSH Config's  <------- #
# -------------------------------- #

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

# zsh_history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase

# history opts
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

# --------------------------------- #
# ---------->  Scripts <----------- #
# --------------------------------- #

# ex = EXtractor for all kinds of archives
ex () {
  if [ -f "$1" ]; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *.deb)       ar x "$1"      ;;
      *.tar.xz)    tar xf "$1"    ;;
      *.tar.zst)   tar xf "$1"    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# reporting tools( fetch scripts ) - install comment when not installed
pfetch 

# -------------------------------- #
# --------->  aliases  <---------- #
# -------------------------------- #

# YouTube-dl aliases for audio and video downloads
alias yta-aac="yt-dlp --extract-audio --audio-format aac"
alias yta-best="yt-dlp --extract-audio --audio-format best"
alias yta-flac="yt-dlp --extract-audio --audio-format flac"
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3"
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"

# change colorscheme of terminal
alias chcolor="bash ~/.termux/scripts/chcolor.sh"

# -------------------------------- #
# --------->  Sources  <---------- #
# -------------------------------- #
source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
typeset -g POWERLEVEL9K_DISABLE_GITSTATUS=true
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
GITSTATUS_LOG_LEVEL=DEBUG
zmodload zsh/zprof
export TERM="xterm-256color"
alias cat='bat --style=plain'
alias ls='ls --color=auto -h'
[[ -s /data/data/com.termux/files/usr/etc/profile.d/autojump.sh ]] && source /data/data/com.termux/files/usr/etc/profile.d/autojump.sh
fortune | cowsay
alias secretcmd='unset HISTFILE; yourcommand; export HISTFILE=\/data/data/com.termux/files/home/.zsh_history'
alias zreset='source ~/.zshrc && clear'
