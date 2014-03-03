# vim: set ft=sh:

# Load local settings not under version control

set -o vi
shopt -s autocd

export ANT_OPTS="-Xmx512m"
export EDITOR='vim'
export HTML_TIDY=~/.tidyrc
export LESSEDIT='sub -l %lm %f'
export MANPATH=/usr/local/share/man:$MANPATH
export PATH=.:~/.dale/bin:/usr/local/bin:$PATH

alias apache="sudo apachectl"
alias la="ls -Flas"
alias path="echo $PATH"
alias todo="grep TODO"

alias g="git"
alias ga="g add"
alias gaa="ga -A"
alias gb="g branch"
alias gc="g commit"
alias gd="g diff"
alias gdt="g difftool"
alias gf="g fetch"
alias gg="g grep"
ghc() { g clone git@github.com:"$1"/"$2"; }
alias gl="g log"
alias gm="g merge"
alias gmt="g mergetool -y"
alias gmy="ghc dhemery"
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

ad () { asciidoc -o - "$@" | bcat; }
jdk () { export JAVA_HOME=`/usr/libexec/java_home -v 1."$@"`; }
sim () { `xcode-select -print-path`/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app/Contents/MacOS/iPhone\ Simulator "$@"; }
simapp () { sim -SimulateApplication "$@"; }

source ~/.dale/profile

# Show * if unstanged changes, + if staged
GIT_PS1_SHOWDIRTYSTATE=1
# Show $ if stash
GIT_PS1_SHOWSTASHSTATE=1
# Show % if untracked files
GIT_PS1_SHOWUNTRACKEDFILES=1
# Show < if behind upstream, > if ahead, <> if diverged
GIT_PS1_SHOWUPSTREAM='auto verbose'
source ~/.git-completion.bash

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

BLUE="\[\e[34m\]"
RED="\[\e[31m\]"
BLACK="\[\e[0m\]"

# Show current directory in blue.
DALE_PS1_DIR="$BLUE\W"
# Show git status in red.
DALE_PS1_GIT="$RED"'$(__git_ps1 " (%s)")'
DALE_PS1_PROMPT_MARKER="$BLACK $ "
# Show identity, then directory, then git status.
export PS1="$DALE_PS1_IDENTITY$DALE_PS1_DIR$DALE_PS1_GIT$DALE_PS1_PROMPT_MARKER"

function directory_to_titlebar {
   local pwd_length=42  # The maximum length we want (seems to fit nicely
                        # in a default length Terminal title bar).
   # Get the current working directory.  We'll format it in $dir.
   local dir="$PWD"

   # Substitute a leading path that's in $HOME for "~"
   if [[ "$HOME" == ${dir:0:${#HOME}} ]] ; then
       dir="~${dir:${#HOME}}"
   fi

   # Append a trailing slash if it's not there already.
   if [[ ${dir:${#dir}-1} != "/" ]] ; then
       dir="$dir/"
   fi

   # Truncate if we're too long.
   # We preserve the leading '/' or '~/', and substitute
   # ellipses for some directories in the middle.
   if [[ "$dir" =~ (~){0,1}/.*(.{${pwd_length}}) ]] ; then
       local tilde=${BASH_REMATCH[1]}
       local directory=${BASH_REMATCH[2]}

       # At this point, $directory is the truncated end-section of the
       # path.  We will now make it only contain full directory names
       # (e.g. "ibrary/Mail" -> "/Mail").
       if [[ "$directory" =~ [^/]*(.*) ]] ; then
           directory=${BASH_REMATCH[1]}
       fi

       # Can't work out if it's possible to use the Unicode ellipsis,
       # '…' (Unicode 2026).  Directly embedding it in the string does not
       # seem to work, and \u escape sequences ('\u2026') are not expanded.
       #printf -v dir "$tilde/\u2026$s", $directory"
       dir="$tilde/...$directory"
   fi

   # Don't embed $dir directly in printf's first argument, because it's
   # possible it could contain printf escape sequences.
   printf "\033]0;%s\007" "$dir"
}

if [[ "$TERM" == "xterm" || "$TERM" == "xterm-color" || "$TERM" == "xterm-256color" ]] ; then
 export PROMPT_COMMAND="directory_to_titlebar"
fi
