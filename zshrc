setopt APPEND_HISTORY
setopt SHARE_HISTORY

# vi mode command line
bindkey -v
bindkey '^R' history-incremental-search-backward

HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

export PATH="$HOME/.rbenv/bin:/opt/phantomjs/bin:/opt/rh/qt48/root/usr/lib64/qt4/bin/:$PATH"
#eval "$(rbenv init -)"

alias b='bundle'
alias bx='bundle exec'
alias vi='vim'

autoload -Uz vcs_info
source ~/.zsh.d/prompt.zsh

autoload -U compinit && compinit
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

