#!/bin/zsh

cd ./ios

rm -rf Podfile.lock

cd ..

fvm flutter clean

fvm flutter pub get

cd ./ios

pod update

pod install --repo-update