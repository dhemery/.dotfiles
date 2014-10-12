alias la="ls -GFlas"
alias path='echo -e ${PATH//:/\\n}'

chapters() { csplit -k -f chapter- "$1" /^#/ {99999};  }

alias g="git"
alias ga="g add"
alias gaa="ga -A"
alias gb="g branch"
alias gc="g commit"
alias gcat="g cat-file -p"
alias gd="g diff"
alias gdp="g diff --no-prefix"
alias gdt="g difftool"
alias gf="g fetch"
alias gg="g grep"
ghc() { g clone git@github.com:"$1"/"$2"; }
alias gl="g log"
alias gm="g merge"
alias gmt="g mergetool -y"
alias gn="git clean"
alias go="g checkout"
alias gr="g rebase"
alias gs="g status"
alias gsf="g svn fetch"
alias gsr="g svn rebase"
alias gsu="g submodule update --init"
alias pull="g pull"
alias push="g push"
alias pre="pull --rebase"

jdk () { export JAVA_HOME=`/usr/libexec/java_home -v 1."$@"`; }

