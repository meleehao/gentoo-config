# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -U compinit
compinit

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
setopt completealiases
zstyle ':completion:*' rehash true
# This will set the default prompt to the walters theme
prompt walters
ttyctl -f
# history 
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000
export HISTSIZE=100000
export SAVEHIST=100000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T]"
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
#

# find histiry for comand 
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward
# speed up dirs find
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
    fi
    chpwd() {
      print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
      }

      DIRSTACKSIZE=20

      setopt autopushd pushdsilent pushdtohome

      ## Remove duplicate entries
      #setopt pushdignoredups
      #
      ### This reverts the +/- operators.
      #setopt pushdminus
      #
# help
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help
# source 
source /usr/share/zsh/site-functions/zsh-autosuggestions.zsh
source /usr/share/zsh/site-functions/zsh-history-substring-search.zsh
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
source /usr/share/zsh/site-functions/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
