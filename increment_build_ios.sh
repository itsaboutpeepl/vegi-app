#! /bin/zsh

BuildNumber=23
NewBuildNumber=$BuildNumber+1

grep -rl 'project.pbxproj' ./ios | xargs sed -i 's/$BuildNumber/$NewBuildNumber/g'

# ~ https://stackoverflow.com/a/38116261