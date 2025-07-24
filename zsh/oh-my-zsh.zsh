# Path to your oh-my-zsh installation. Needed for plugins and themes.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Reset the ZSH variable to point to the dotfiles directory
export ZSH=$HOME/.dotfiles
# Re-source aliases to override oh-my-zsh aliases
source $ZSH/zsh/aliases.zsh