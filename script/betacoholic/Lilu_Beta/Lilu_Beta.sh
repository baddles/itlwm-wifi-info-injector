#!/usr/bin/env sh

#git clone https://github.com/acidanthera/Lilu.git
dir="${0%/*}"
mkdir "$dir/Product/Debug"
mkdir "$dir/Product/Release"
xcodebuild -project ./Lilu/Lilu.xcodeproj -configuration Debug CONFIGURATION_BUILD_DIR=$(echo "$dir"/Product/Debug/)

xcodebuild -project ./Lilu/Lilu.xcodeproj -configuration Release CONFIGURATION_BUILD_DIR=$(echo "$dir"/Product/Release/)
