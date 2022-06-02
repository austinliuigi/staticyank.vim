# staticyank.vim
Yank without moving the cursor

# Installation
Install using a package manager or with native packages:
```
mkdir -p ~/.vim/pack/austinliuigi/start
git clone https://github.com/austinliuigi/staticyank.vim.git ~/.vim/pack/austinliuigi/start
```

# Features
* Works in both normal and visual mode (including visual-block)
* Works with text objects
* Registers behave normally
* No screen flickering

# Options
Mappings that allow the plugin to work are enabled by default.

To disable staticyank.vim, add this to your vimrc:
```
let g:StaticYankDisable = 1
```

# Differences from other plugins
Uses `:yank` ex-command for linewise yanking to avoid screen redraws that cause flickering

# Credit
Inspired by:
* svban/YankAssassin.vim
