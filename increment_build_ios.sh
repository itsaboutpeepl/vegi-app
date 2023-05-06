#! /bin/zsh

grep -r 'CURRENT_PROJECT_VERSION = ' ./ios/Runner.xcodeproj | xargs echo

BuildNumber=25
NewBuildNumber=$BuildNumber+1

grep -rl 'project.pbxproj' ./ios | xargs sed -i 's/$BuildNumber/$NewBuildNumber/g'

# ~ https://stackoverflow.com/a/38116261