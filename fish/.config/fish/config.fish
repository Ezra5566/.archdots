set -g fish_greeting

if status is-interactive
    starship init fish | source
end

set -x EDITOR "nvim" 

# List Directory
#alias l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto --git --icons=always' # short list
#alias lsd='lsd --group-directories-first -A'
#alias ld='eza -lhD --icons=auto' # long list dirs
#alias lt='eza --tree --level=1 --color=always --long --git --icons=always --no-time --no-user --no-permissions' # list folder as tree
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
# Basic listing with icons and colors
alias l='lsd'
alias ll='lsd -l --icon=always --color=auto --human-readable'
alias lt='lsd  --tree --depth=2 --icon=always --color=auto'
alias la='lsd -a --icon=always --color=auto'
alias ltt='lsd --tree --depth=3 --icon=always --color=auto'
alias ldf='lsd -l --group-dirs=first --icon=always --color=auto --human-readable'
alias lds='lsd -lh --group-dirs=first --color=auto'
alias lst='lsd -l --sort=time --icon=always --color=auto --human-readable'
alias ldirs='lsd --group-dirs=first --icon=always --color=auto'
alias lsize='lsd -l --sort=size --icon=always --color=auto --human-readable'



# Quickly preview the home directory
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
