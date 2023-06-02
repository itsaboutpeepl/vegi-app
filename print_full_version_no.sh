#! /bin/zsh/

cd ./ios
echo "Version number:"
xcrun agvtool what-marketing-version
echo "Build number:"
xcrun agvtool what-version

cd ..