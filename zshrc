# Exports
export ZSH=~/.oh-my-zsh
export PYENV_ROOT="$HOME/.pyenv"

export PATH=""
export PATH="/usr/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/sbin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"
export PATH="/Applications/LibreOffice.app/Contents/MacOS/:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

export PGGSSENCMODE=disable
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export BUNDLER_EDITOR=mvim

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
export HOMEBREW_NO_AUTO_UPDATE=1

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

eval "$(pyenv init --path)"
eval "$(nodenv init -)"

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/benliscio/.sdkman"
[[ -s "/Users/benliscio/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/benliscio/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

dbs() {
  local current_branch=$(git branch --show-current)
  if [ "$current_branch" != "main" ]; then
    echo "Aborting: You are not on the main branch."
    return 1
  fi
  local branch_name=$(echo $1 | cut -c1-50)
  dbcli linear start --no-checkout --branch-name $branch_name
  git worktree-make $branch_name
  cd ../$branch_name
  ln -s ../daisyBill/.claude .claude

  bin/setup -d -s review-app
  mvim
}

cpr() {
  local COMMIT_MESSAGE=$(gh pr view --json title --jq '.title' | sed 's/"/\\"/g' | sed -E 's/^ENG-[0-9]+[[:space:]]*-[[:space:]]*//')
  dbcli github commit -m "$COMMIT_MESSAGE"
}
