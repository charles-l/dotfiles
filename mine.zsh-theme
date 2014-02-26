# The prompt

PROMPT='%{$fg[green]%}(%c) %{$reset_color%}'

# The right-hand prompt

RPROMPT='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}'

# Add this at the start of RPROMPT to include rvm info showing ruby-version@gemset-name
# %{$fg[yellow]%}$(~/.rvm/bin/rvm-prompt)%{$reset_color%} 

# local time, color coded by last return code

ZSH_THEME_GIT_PROMPT_PREFIX=" git %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} drty"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ut"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} c"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} a"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} m"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} dl"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} r"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} umrgd"
