# Environment
alias cdpath='printf "%s\n" $cdpath'
alias cdpaths='cdpath | sort --ignore-case'
alias envs='env | sort --ignore-case'
alias fpath='printf "%s\n" $fpath'
alias fpaths='fpath | sort --ignore-case'
alias path='printf "%s\n" $path'
alias paths='path | sort --ignore-case'

# General commands
alias la='ls -GFlas'
alias ll='ls -l'

# Docker
alias dcla='docker container ls --all'
alias dcls='docker container ls'
alias dcrm='docker container rm'
alias dila='docker image ls --all'
alias dils='docker image ls'
alias dirm='docker image rm'

# Git
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch --all --verbose --verbose'
alias gc='git commit'
alias gco='git switch'
alias gcon='git config'
alias gcong='git config --global'
alias gconl='git config --local'
alias gd='git diff'
alias gf='git fetch'
alias gg='git grep'
alias gl='git log --graph --oneline -20'
alias gll='git log --graph --oneline'
alias gls='git show --name-only'
alias glv='git log --graph'
alias gm='git merge'
alias gn='git clean'
alias gpl='git pull'
alias gps='git push'
alias gpr='git pull --rebase'
alias gr='git rebase'
alias grs='git restore'
alias gru='git remote update'
alias gs='git status'
alias gsu='git submodule update --init --recursive'
alias gxx='git restore -WSs@'

# Go
alias gob='go build'
alias goba='go build ./...'
alias goc='go clean'
alias god='go doc'
alias gof='go fmt'
alias gofa='go fmt ./...'
alias gog='go get'
alias gol='go list'
alias gom='go mod'
alias gor='go run'
alias got='go test'

# Gradle
alias gw='./gradlew'

# Kubernetes
alias k='kubectl'

