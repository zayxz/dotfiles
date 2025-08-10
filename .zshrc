# Plugins
source <(fzf --zsh)
# Starship
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Yazi 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Alias
alias yy="yazi"
alias mpdr="systemctl --user restart mpd"
alias eza="eza --long --total-size --sort=size -h -a --icons -s type --no-permissions"
alias ls="eza -l --icons --no-user --no-time --no-filesize"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
