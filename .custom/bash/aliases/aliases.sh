# Quick bashrc
alias rebash='source $HOME/.bashrc'
alias bashrc='vim $CUSTOM_BASH/.bashrc'

 # Alias common ls
alias la='ls -Alh' # show hidden files
alias ls='ls -aFh --color=always --ignore={}"*"' # add collors and file type extensions
alias lr='ls -lRh' # recursive ls
alias ll='ls -Fls' # long listing format

# Linux update, use aptitude instead of apt
alias update='sudo aptitude update'
alias upgrade='sudo aptitude upgrade'
alias install='sudo aptitude install'
alias uninstall='sudo aptitude remove'