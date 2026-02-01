# Anchor file sourced by Oh My Zsh from $ZSH_CUSTOM.
# It loads the rest of the custom config from this repo.

DOTFILES_ZSH_DIR="${0:A:h}"

# Load files in a predictable order.
for f in \
  "$DOTFILES_ZSH_DIR/env.zsh" \
  "$DOTFILES_ZSH_DIR/aliases.zsh" \
  "$DOTFILES_ZSH_DIR/keybindings.zsh" \
  "$DOTFILES_ZSH_DIR/tools/mise.zsh"
do
  [ -r "$f" ] && source "$f"
done

