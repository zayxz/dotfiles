# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
source "$HOME/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme"
#eval "$(starship init zsh)"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source /home/zaddy/.zsh/plugins/zsh-shift-select.plugin.zsh
source <(fzf --zsh)
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi
# Created by newuser for 5.9
# You've already sourced the theme above
# ZSH_THEME="$HOME/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme"
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zaddy/.zshrc'
#Plugins
autoload -Uz compinit
compinit

# End of lines added by compinstall


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

##Alias
alias wifi="impala"
alias yy="yazi"
alias cl="rm -rf ~/.cache/cliphist"
alias trash="rm -r ~/.local/share/Trash/*"
