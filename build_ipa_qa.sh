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

echo "Now:"
xcrun agvtool what-version

cd ..

fvm flutter build ipa --dart-define ENV=qa

cd ./ios

xcrun agvtool next-version -all


echo "Next build will be:"
xcrun agvtool what-version

cd ..


open build/ios/ipa/