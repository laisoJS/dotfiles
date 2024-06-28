#!/bin/bash

CONFIG_DIR=$HOME/.config
SCRIPT_DIR=$HOME/.scripts


PACKAGES=(git exa bat tldr ripgrep fastfetch neovim fzf zellij zoxide btop kitty waybar)

install_packages() {
  echo "Installing packages..."

  for package in "${PACKAGES[@]}"; do
    if ! pacman -Qi $package >/dev/null 2>&1; then
      echo "Installing $package ..."
      sudo pacman -S --no-confirm $package
    else
      echo "$package is already installed"
    fi
  done
}


# Run function
install_packages
