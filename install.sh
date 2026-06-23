#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
SHARED=(zsh tmux nvim ghostty workmux vim agents claude codex)

case "$(uname -s)" in
  Darwin) OS_PACKAGES=(zsh-macos) ;;
  Linux)  OS_PACKAGES=(zsh-linux) ;;
  *) echo "Unknown OS: $(uname -s)" >&2; exit 1 ;;
esac

stow -d "$DOTFILES" -t "$HOME" "${SHARED[@]}" "${OS_PACKAGES[@]}"
