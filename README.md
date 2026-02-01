# dotfiles

Personal configuration files and bootstrap scripts for Unix-like systems.

This repository is intentionally scoped:
- it manages personal configuration
- it bootstraps required tooling
- it avoids owning unnecessary system-wide state

---

## What this repo does

### Manage home-directory config files

Files under `home/` mirror paths under `$HOME` and are symlinked in place.

Currently managed:
- `~/.nanorc`

Linking is handled by:

```bash
scripts/install
````

Existing files are backed up to:

```
~/.dotfiles-backup/<timestamp>/
```

---

### Bootstrap required tools

The `scripts/bootstrap` script installs or updates required tooling on Ubuntu systems:

* `zsh`
* Oh My Zsh (cloned to `~/.oh-my-zsh`)
* `mise`
* nano syntax definitions (via `scopatz/nanorc`)

The script is idempotent and safe to re-run.

```bash
scripts/bootstrap
```

---

### Manage Oh My Zsh custom configuration

This repo stores Oh My Zsh custom configuration under:

```
zsh/custom/
```

Rather than symlinking many files into `$ZSH_CUSTOM`, a single anchor file is installed:

```
$ZSH_CUSTOM/dotfiles.zsh -> <repo>/zsh/custom/dotfiles.zsh
```

That anchor file sources the rest of the custom configuration from this repo in a fixed order.

Installation is handled by:

```bash
scripts/install-zsh-custom
```

Notes:

* Oh My Zsh must be installed for this to work (handled by `scripts/bootstrap`)
* `$ZSH_CUSTOM` is discovered dynamically; the default is `~/.oh-my-zsh/custom`
* The target directory can be overridden by setting `DOTFILES_ZSH_CUSTOM`

Example:

```bash
DOTFILES_ZSH_CUSTOM="$HOME/.config/omz-custom" scripts/install-zsh-custom
```

---

## Typical setup on a new machine

```bash
git clone git@github.com:Greggolas/dotfiles.git ~/dotfiles
cd ~/dotfiles

scripts/bootstrap
scripts/install
```

Start a new shell (or `exec zsh`) to pick up changes.

---

## Design notes

* Oh My Zsh itself is not tracked in this repo.
* Zsh custom config is structured, ordered, and owned by this repo.
* Machine-specific or experimental tweaks should live outside this repo.
* The goal is predictability and easy recovery, not clever automation.

```
```
