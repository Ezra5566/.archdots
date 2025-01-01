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
alias lt='eza --icons=auto --tree' # list folder as tree
alias c='code'
alias zl='lazygit'
# fzf search
alias fzf='fzf --height 40% --layout=reverse --border --preview "bat --style=numbers --color=always {}"'
alias fzfp='fzf --preview "bat --style=numbers --color=always {}"'
# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'
zoxide init fish | source
atuin init fish | source
