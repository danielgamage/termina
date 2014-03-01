# git conditionals
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[green]%}[%{$reset_color%} %{$fg_bold[yellow]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg_bold[green]%} ]%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}>"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}#"

# git status
function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# start of line
function prompt_char {
  if [ $UID -eq 0 ]; then
    echo "%{$fg[yellow]%}#%{$reset_color%}";
  else 
    echo "%{$fg[yellow]%}→%{$reset_color%}"; 
  fi
}

# build that prompt
PROMPT='%(?, ,%{$fg[red]%}FAIL%{$reset_color%}
)
%{$fg[cyan]%}%n%{$reset_color%} %{$fg_bold[green]%}%~%{$reset_color%}$(my_git_prompt_info)
%_ $(prompt_char) '

RPROMPT='%{$fg_bold[green]%}$(rvm_prompt_info)%{$reset_color%}'
