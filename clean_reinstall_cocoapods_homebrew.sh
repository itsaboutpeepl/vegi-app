#!/bin/zsh

# From september 2022, we just reinstalled cocoapods with homebrew:
# ~https://stackoverflow.com/a/65334677

# * This only needs to be run once on a new machine to use cocoapods on silicone macs!

# Uninstall the local cocoapods gem
sudo gem uninstall cocoapods

# Reinstall cocoapods via Homebrew
brew install cocoapods