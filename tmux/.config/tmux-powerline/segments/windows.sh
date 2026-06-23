# shellcheck shell=bash
run_segment() {
  local sep="${TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD:-▶}"
  local result=""

  while IFS='|' read -r index name flags active; do
    local f="${flags//\*/}"
    local label="${index}${f:- } ${name}"
    if [ "$active" = "1" ]; then
      result+="#[fg=colour234,bg=colour37]${sep} ${label} #[fg=colour37,bg=colour234]${sep}"
    else
      result+=" ${label} "
    fi
  done < <(tmux list-windows -F "#{window_index}|#{window_name}|#{window_flags}|#{window_active}" 2>/dev/null)

  echo -n "$result"
}
