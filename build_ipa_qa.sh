#! /bin/zsh

# grep -r 'CURRENT_PROJECT_VERSION = ' ./ios/Runner.xcodeproj | xargs echo

# BuildNumber=25
# NewBuildNumber=$BuildNumber+1

# grep -rl 'project.pbxproj' ./ios | xargs sed -i 's/$BuildNumber/$NewBuildNumber/g'

# ~ https://stackoverflow.com/a/38116261

cd ./ios

# Commenting out for now as done automatically in iosbuild now ~ https://stackoverflow.com/questions/9258344/better-way-of-incrementing-build-number
# echo "Current:"
# xcrun agvtool what-version

# xcrun agvtool next-version -all

echo "Current version of builds is (remember increments on every build, not just on publish...):"
xcrun agvtool what-version

echo "see https://www.notion.so/gember/xcode-Better-way-of-incrementing-build-number-Stack-Overflow-3bbd3f4a1f9948c287360aa5523685cc for smarter builds"

cd ..

fvm flutter build ipa --dart-define ENV=qa

cd ./ios

echo "Not manually incrementing build for now as xcode uses avgtool to autoincrement of EVERY build call anyways"
# xcrun agvtool next-version -all


echo "Next build will be:"
xcrun agvtool what-version

cd ..

open build/ios/ipa/
