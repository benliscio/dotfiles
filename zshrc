# Exports
export ZSH=~/.oh-my-zsh
export PATH="/Users/benliscio/.rbenv/shims:/usr/local/bin:/Users/benliscio/.bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/benliscio/.rbenv/bin"
export PATH="$HOME/.yarn/bin:/usr/local/Cellar/node/8.1.2/bin:$PATH"
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
