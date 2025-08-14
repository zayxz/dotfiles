# Plugins
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# History
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Yazi 
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Clean Trash
function trash() {
    local TRASH_DIR="$HOME/.local/share/Trash"
    if [ -z "$(ls -A "$TRASH_DIR")" ]; then
        echo "Empty."
    else
        echo "Removing trash:"
        ls "$TRASH_DIR"
        echo -n "Proceed (y/n): "
        read confirm
        if [[ "$confirm" == "y" ]]; then
            rm -rf "$TRASH_DIR"/*
            echo "Trash removed."
        else
            echo "Aborted."
        fi
    fi
}

# Alias
alias yy="yazi"
alias mpdr="systemctl --user restart mpd"
alias eza="eza --long --total-size --sort=size -h -a --icons -s type --no-permissions"
alias ls="eza -l --icons --no-user --no-time --no-filesize"
alias speed="speedtest-cli --secure --bytes"
alias bat="bat --theme base16-256 -s"
alias dust="dust -P -b"
