# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

HISTSIZE=100000

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#PATH=/usr/local/bin:$PATH

bindkey -v

alias be="bundle exec"
alias deploys="bin/rake staging deploy"
alias deployp="bin/rake production deploy"
alias hrrs="heroku run rails c -r staging"
alias hrrp="heroku run rails c -r production"
alias history='fc -l'
alias plog='tail -f log/development.log'

export PATH=$PATH:$(brew --cellar git)'/'$(git --version | sed 's/git version //' | sed 's/ (Apple Git-55)//')/share/git-core/contrib/diff-highlight
export PATH=/usr/local/bin:$PATH

# http://qiita.com/items/9dd797f42e7bea674705
export PATH="$PATH:$HOME/.rbenv/bin:/usr/local/sbin"
eval "$(rbenv init -)"

export PATH="/usr/local/opt/postgresql@9.5/bin:$PATH"

autoload -Uz add-zsh-hook
source ~/.zsh.d/zsh-notify/notify.plugin.zsh

# http://rcmdnk.github.io/blog/2013/12/05/mac-homebrew/
if [ -f ~/.brew_api_token ];then
  source ~/.brew_api_token
fi
