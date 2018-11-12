set -o vi
shopt -s autocd

export CDPATH=.:~
export EDITOR='vim'
export PATH=${PATH}:.:${HOME}/.bin
export XDG_CONFIG_HOME="$HOME/.config"
export SSL_CERT_FILE="$HOME/.ssh/cacert.pem"

ruby_bin=/usr/local/opt/ruby/bin
gems_bin=/usr/local/lib/ruby/gems/2.5.0/bin

[[ -d "${ruby_bin}" ]] && export PATH=${ruby_bin}:$PATH
[[ -d "${gems_bin}" ]] && export PATH=${gems_bin}:$PATH

# Source the first argument that is an existing file
source_first() {
  for f in "$@"; do [[ -f "$f" ]] && . "$f" && return; done
  echo "Could not source any of: $@"
}

# Bash completion script
source_first \
    "/usr/local/etc/bash_completion" \
    "/usr/share/bash-completion/bash_completion"

# Git completion script
source_first \
    "/usr/local/etc/bash_completion.d/git-completion.bash" \
    "/usr/share/bash-completion/completions/git" \
    "/etc/bash_completion.d/git"

# Liquid prompt script (if this is an interactive shell)
[[ $- = *i* ]] \
    && source_first \
    "/usr/local/share/liquidprompt" \
    "$HOME/.installed/liquidprompt/liquidprompt"

# Replace liquidprompt's _lp_title(), which prepends an unwanted newline if
# LP_ENABLE_TITLE is on.
_lp_title()
{
  echo -nE "${_LP_OPEN_ESC}${LP_TITLE_OPEN}$(_lp_as_text "$1")${LP_TITLE_CLOSE}${_LP_CLOSE_ESC}"
}

# Try --list-cmds option from git 2.18
git_aliases=$(git --list-cmds=alias 2>/dev/null)
# If --list-cmds fails, try _git_aliases(), which is defined in pre-2.18
# versions of the git completion script)
[[ $? = 0 ]] || git_aliases=$(__git_aliases 2>/dev/null)
[[ $? = 0 ]] || echo "Could not list git aliases"

for al in $git_aliases; do
  # Make a shorthand version of each alias
  alias g$al="git $al"

  # Complete the alias as if it were the original command
  complete_func=_git_$(__git_aliased_command $al)
  [[ -n $(declare -F $complete_fnc) ]] && __git_complete g$al $complete_func
done

# TODO: Check for direnv before running this?
eval "$(direnv hook bash)"

envs() { env | sort; }
gw() { gradlew "$@"; }
la() { ls -GFlas "$@" ; }
path() { echo -e ${PATH//:/\\n}; }
ww() { which "$@" && readlink $(which "$@") || true ; }

# Docker shortcuts
dc() { docker container "$@"; }
dcls() { dc list "$@"; }
dcla() { dcls -a  "$@"; }
di() { docker image "$@"; }
dils() { di list "$@"; }
dila() { dils -a "$@"; }
dps() { docker ps "$@"; }
dpsa() { dps -a "$@"; }
dr() { docker run "$@"; }

complete -F _gradle -d gw

[[ -f $HOME/.bash_local ]] && . $HOME/.bash_local
