#!/bin/zsh

cd ./ios

rm -rf Podfile.lock

cd ..

flutter clean

cd ./ios

pod update

pod install --repo-update