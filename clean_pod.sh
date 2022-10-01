#!/bin/zsh

cd ./ios

rm -rf Podfile.lock

# From september 2022, we just reinstalled cocoapods with homebrew:
# ~https://stackoverflow.com/a/65334677
# * zsh ./clean_reinstall_cocoapods_homebrew.sh
# gem install --user-install ffi -- --enable-libffi-alloc

alias pod='arch -x86_64 pod'

flutter precache --ios

pod install --repo-update

cd ..