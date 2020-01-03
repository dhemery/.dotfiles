setopt prompt_subst
autoload -U colors
colors # Enable colors in prompt

# Show up to 5 dirs, always showing first 1 and last 3.
PROMPT='[%F{blue}%(5~|%-1~/…/%3~|%4~)%f] %(?..%F{red}%? %f)%# '

default_color+="%{$reset_color%}"
git_symbol_color="%{$fg[blue]%}"
git_symbol='±'
git_stashes_symbol='§'

git_severity_colors=(
  "%{$fg[blue]%}"
  "%{$fg[green]%}"
  "%{$fg[red]%}"
  "%{$fg_bold[red]%}"
)

git_clean_severity=1
git_clean_color="${git_severity_colors[$git_clean_severity]}"


git_commits_ahead_severity=2
git_commits_ahead_color="${git_severity_colors[$git_commits_ahead_severity]}"
git_commits_ahead_symbol='↑'

git_commits_behind_severity=3
git_commits_behind_color="${git_severity_colors[$git_commits_behind_severity]}"
git_commits_behind_symbol='↓'

git_merging_severity=3
git_merging_color="${git_severity_colors[$git_merging_severity]}"
git_merging_symbol='≠'

git_cached_severity=2
git_cached_color="${git_severity_colors[$git_cached_severity]}"
git_cached_symbol='+'

git_modified_severity=3
git_modified_color="${git_severity_colors[$git_modified_severity]}"
git_modified_symbol='*'

git_untracked_severity=4
git_untracked_color="${git_severity_colors[$git_untracked_severity]}"
git_untracked_symbol='?'

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  if [[ -n "$git_where" ]]; then
    local branch_severity=$git_clean_severity
    local prompt_string=""
    prompt_string+="$git_symbol_color$git_symbol"

    # Check for stashes
    if git rev-list --walk-reflogs --quiet refs/stash 2> /dev/null; then
      prompt_string+="$git_stashes_symbol"
    fi

    prompt_string+="$default_color"
    prompt_string+="["

    # Commits ahead of upstream
    local commits_ahead="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$commits_ahead" -gt 0 ]; then
      prompt_string+="$git_commits_ahead_color$git_commits_ahead_symbol$commits_ahead"
      if [[ "$branch_severity" -le $git_commits_ahead_severity ]]; then
        branch_severity=$git_commits_ahead_severity
      fi
    fi

    # Commits behind upstream
    local commits_behind="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
    if [ "$commits_behind" -gt 0 ]; then
      prompt_string+="$git_commits_behind_color$git_commits_behind_symbol$commits_behind"
      if [[ "$branch_severity" -le $git_commits_behind_severity ]]; then
        branch_severity=$git_commits_behind_severity
      fi
    fi

    # Merging
    local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
    if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
      prompt_string+="$git_merging_color$git_merging_symbol"
      if [[ "$branch_severity" -le $git_merging_severity ]]; then
        branch_severity=$git_merging_severity
      fi
    fi

    # Index has uncommitted changes
    if ! git diff --cached --quiet 2> /dev/null; then
      prompt_string+="$git_cached_color$git_cached_symbol"
      if [[ "$branch_severity" -le $git_cached_severity ]]; then
        branch_severity=$git_cached_severity
      fi
    fi

    # Worktree has changes to tracked files
    if ! git diff --quiet 2> /dev/null; then
      prompt_string+="$git_modified_color$git_modified_symbol"
      if [[ "$branch_severity" -le $git_modified_severity ]]; then
        branch_severity=$git_modified_severity
      fi
    fi

    # Worktree has untracked files
    if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
      prompt_string+="$git_untracked_color$git_untracked_symbol"
      if [[ "$branch_severity" -le $git_untracked_severity ]]; then
        branch_severity=$git_untracked_severity
      fi
    fi

    if [[ "$branch_severity" -gt 1 ]]; then
      # Separate the status details from the branch
      prompt_string+="$default_color"
      prompt_string+="]["
    fi

    prompt_string+="${git_severity_colors[$branch_severity]}"
    prompt_string+="${git_where#(refs/heads/|tags/)}"
    prompt_string+="$default_color"
    prompt_string+="]"
    echo "$prompt_string"
  fi
}

RPROMPT='$(git_prompt_string)'

