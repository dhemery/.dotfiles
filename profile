# vim: set ft=sh:

set -o vi
shopt -s autocd

export ANT_OPTS="-Xmx512m"
export EDITOR='vim'
export HTML_TIDY=~/.tidyrc
export LESSEDIT='sub -l %lm %f'
export MANPATH=/usr/local/share/man:$MANPATH
export PATH=.:~/.bin:$PATH:/usr/local/sbin

alias apache="sudo apachectl"
alias g="git"
alias la="ls -Flags"
alias path="echo $PATH"
alias todo="grep TODO"

ad () { asciidoc -o - "$@" | bcat; }
jdk () { export JAVA_HOME=`/usr/libexec/java_home -v 1."$@"`; }
sim () { `xcode-select -print-path`/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app/Contents/MacOS/iPhone\ Simulator "$@"; }
simapp () { sim -SimulateApplication "$@"; }

# Show * if unstanged changes, + if staged
export GIT_PS1_SHOWDIRTYSTATE=1
# Show $ if stash
export GIT_PS1_SHOWSTASHSTATE=1
# Show % if untracked files
export GIT_PS1_SHOWUNTRACKEDFILES=1
# Show < if behind upstream, > if ahead, <> if diverged
export GIT_PS1_SHOWUPSTREAM='auto verbose'
source ~/.git-completion.bash

# Show current directory in blue.
DALE_PS1_DIR='\[\e[34m\]\W'
# Show git status in red.
DALE_PS1_GIT='\[\e[31m\]$(__git_ps1 " (%s)")'
# Show prompt in black.
DALE_PS1_PROMPT='\[\e[0m\] $ '
# Show directory, then git status, then prompt.
export PS1=$DALE_PS1_DIR$DALE_PS1_GIT$DALE_PS1_PROMPT

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

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

# Load local settings not under version control
source ~/.dale/profile

