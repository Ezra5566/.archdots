set -g fish_greeting

if status is-interactive
    starship init fish | source
end

set -x EDITOR "vim" 

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias lsd='lsd --group-directories-first -A'
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --tree --level=1 --color=always --long --git --icons=always --no-time --no-user --no-permissions' # list folder as tree
alias c='code'
alias zl='lazygit'
alias cmatrix='unimatrix -n -s 96 -l o'
# fzf search
alias fzf='fzf --height 40% --layout=reverse --border --preview "bat --style=numbers --color=always {}"'
alias fzfp='fzf --preview "bat --style=numbers --color=always {}"'
# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'
#------------------------yazi------------------------
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
#----------------------------------------------------
# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'
zoxide init fish | source
atuin init fish | source
