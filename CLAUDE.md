# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository forked from [holman/dotfiles](https://github.com/holman/dotfiles). It uses a **topical organization** where each directory represents a configuration area (git, zsh, nvim, etc.). The repository is designed to work on both macOS and Linux, with automatic platform detection and conditional configuration loading.

## Architecture

### Topical Structure

Configuration is organized by topic in top-level directories. Each topic follows naming conventions that control how files are processed:

- **`*.symlink`** - Symlinked to `$HOME` (e.g., `gitconfig.symlink` → `~/.gitconfig`)
- **`*.zsh`** - Auto-loaded into zsh environment
- **`path.zsh`** - Loaded first to set up `$PATH`
- **`completion.zsh`** - Loaded last for autocomplete setup
- **`install.sh`** - Executed during installation for topic-specific setup
- **`link.sh`** - Custom symlinking logic for the topic
- **`.macos-only`** - Marker file to skip topic on Linux

### Key Directories

- **`bin/`** - Executables added to `$PATH` (git utilities, `dot` maintenance script, `todo`)
- **`functions/`** - Zsh functions for interactive workflows (fzf integration)
- **`script/`** - Core installation/management scripts
- **`zsh/zshrc.symlink`** - Main zsh entry point that orchestrates config loading
- **`macos/set-defaults.sh`** - macOS system preferences
- **`claude/`** - Minimal delegation to `.dotfiles.sap/claude/` for Claude Code configuration

### Configuration Loading Flow (zsh)

1. Source `~/.localrc` if it exists (for private environment variables)
2. Collect all `*.zsh` files from `$ZSH` and optionally `$ZSH_SAP`
3. Load all `path.zsh` files first
4. Load all other `*.zsh` files (except `completion.zsh`)
5. Initialize autocomplete
6. Load all `completion.zsh` files last

## Essential Commands

### Initial Setup
```bash
# Clone and bootstrap (first-time setup)
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

### Managing Dotfiles
```bash
# Update everything (pull changes, update Homebrew, run installers)
dot

# Edit dotfiles in your editor
dot --edit

# Re-symlink all dotfiles
script/link

# Install/reinstall all dependencies
script/install
```

### Symlinking System

- **`script/bootstrap`** - Interactive setup: creates git config, symlinks all `*.symlink` files, runs installers
- **`script/link`** - Non-interactive: force-symlinks all `*.symlink` files and runs `link.sh` scripts
- Both handle platform-specific topics via `.macos-only` marker files

### Homebrew Management

```bash
# Install packages from Brewfile
brew bundle

# Update Brewfile with currently installed packages
brew bundle dump --force --file="$ZSH/Brewfile"
```

## Platform Support

The dotfiles support both macOS and Linux:

- **Platform detection**: `[[ "$(uname -s)" == "Darwin" ]]` for macOS
- **Conditional loading**: Topics with `.macos-only` file are skipped on Linux
- **Homebrew paths**: Supports both `/opt/homebrew` (Apple Silicon), `/usr/local` (Intel Mac), and `/home/linuxbrew/.linuxbrew` (Linux)

## Important Variables

- **`$ZSH`** - Points to `~/.dotfiles` (main dotfiles directory)
- **`$ZSH_SAP`** - Optional secondary dotfiles directory (e.g., `~/.dotfiles.sap`)
- **`$PROJECTS`** - Default project directory (`~/SAPDevelop`)
- **`$DOTFILES_ROOT`** - Used in scripts to reference repository root

## Adding New Configuration

### New Topic
1. Create directory (e.g., `mytopic/`)
2. Add configuration files with appropriate extensions
3. Optional: Add `install.sh` for setup commands
4. Optional: Add `.macos-only` file to restrict to macOS

### New Binary
1. Add executable to `bin/` directory
2. It will be automatically added to `$PATH`

### New Zsh Function
1. Add file to `functions/` directory
2. Update `zsh/fpath.zsh` if needed to include in `fpath`

## Git Workflow Utilities

The `bin/` directory contains numerous git utilities:
- `git-amend` - Amend last commit
- `git-undo` - Undo last commit
- `git-nuke` - Hard reset branch
- `git-promote` - Promote tracking branch
- `git-delete-local-merged` - Clean up merged branches
- `git-wtf` - Show branch/tracking status

## Local Overrides

- **`~/.localrc`** - Private environment variables (sourced by zshrc, not version controlled)
- **`git/gitconfig.local.symlink`** - Local git config (created during bootstrap, not version controlled)

## Claude Code Configuration

Claude Code supports two profiles, switched with `claude-profile`:

- **personal** — lives in `~/.dotfiles/claude/` (this repo). Used with the personal Anthropic account.
- **work** — lives in `~/.dotfiles.sap/claude/` (private repo). Used with the SAP work account.

`~/.claude` is a symlink to the active profile's directory. `~/.claude.json` is stashed to `<profile>/claude.json.live` on switch. Keychain credentials are stashed under `Claude Code-credentials-<profile>` and restored to `Claude Code-credentials` for the active profile.

### Switching profiles

```bash
claude-profile             # show active profile
claude-profile status      # show full state (symlink, Keychain entries)
claude-profile work        # switch to work
claude-profile personal    # switch to personal
```

The script refuses to switch if any Claude process is running. Quit all Claude sessions first.

### First-time setup of a profile

After switching to a profile that has never been logged into, run `claude login` once. Subsequent switches stash and restore the credentials automatically.

### Bootstrap

`script/link` runs `claude/link.sh`, which reads `~/.claude-active-profile` and points `~/.claude` at the right directory. The default profile on a fresh machine is `personal`.

