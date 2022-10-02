#!/bin/zsh

cd ./ios

rm -rf Podfile.lock

cd ..

flutter clean

flutter pub get

cd ./ios

pod update

pod install --repo-update