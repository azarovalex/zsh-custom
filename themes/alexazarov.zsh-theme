ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

jj_prompt_info() {
  # Exit if we're not in a jj repository. This allows the prompt to fall back to git.
  if ! jj root &> /dev/null; then
    return 1
  fi

  # Assemble the prompt string
  echo -n "%{$fg_bold[blue]%}jj:(%{$fg[red]%}"
  echo -n "$(jj_prompt_template 'self.change_id().shortest(3)')"
  echo -n "%{$fg[blue]%})"
  echo -n "%{$reset_color%} "
  return 0
}

_alexazarov_vcs_info() {
  jj_prompt_info || git_prompt_info
}

PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(_alexazarov_vcs_info)'