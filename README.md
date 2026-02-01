# dotfiles

Personal configuration files for Unix-like systems.

This repo intentionally keeps configs lightweight and portable. External dependencies are bootstrapped explicitly.

## Structure

- `home/`  
  Files here mirror paths under `$HOME` and are symlinked in place.

- `scripts/install`  
  Creates symlinks from `home/` into `$HOME`, backing up any existing files.

- `scripts/bootstrap`  
  Fetches external, non-versioned dependencies (currently nano syntax files).

## Setup on a new machine

```bash
git clone git@github.com:<username>/dotfiles.git ~/dotfiles
~/dotfiles/scripts/bootstrap
~/dotfiles/scripts/install
