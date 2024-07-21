HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

export PATH="$HOME/.local/bin:$PATH"

# Alias
alias l='ls -a'
alias ll='ls -la'
alias lg='lazygit'
alias kc='kubectl'
alias mk='minikube'
alias tf='terraform'
alias zj='zellij'

# Goenv
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

# Direnv
eval "$(direnv hook zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Alacritty
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Zinit
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ----------------------------
# # Zinit plugins
# # ----------------------------
# # Load the pure theme, with zsh-async library that's bundled with it.
# #zinit ice pick"async.zsh" src"pure.zsh"
# #zinit light sindresorhus/pure
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word

# Starship
eval "$(starship init zsh)"

