# Exports
export ZSH=~/.oh-my-zsh

export PATH=""
export PATH="/usr/local/bin/yarn:$PATH"
export PATH="/usr/local/bin/node:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/sbin:$PATH"
export PATH="bundle binstubs$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export BUNDLER_EDITOR=mvim

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

eval "$(rbenv init - --no-rehash)"

# ohmyzsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

setopt hist_ignore_all_dups inc_append_history
HISTSIZE=8192
SAVEHIST=8192

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
