#!/bin/bash

SCHEME="WMYFAdAdapter"
PROJECT="Demo_OC.xcodeproj"
OUTPUT="./output"

rm -rf $OUTPUT
mkdir $OUTPUT

# iOS
xcodebuild archive \
  -project $PROJECT \
  -scheme $SCHEME \
  -sdk iphoneos \
  -archivePath $OUTPUT/ios \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Simulator
xcodebuild archive \
  -project $PROJECT \
  -scheme $SCHEME \
  -sdk iphonesimulator \
  -archivePath $OUTPUT/sim \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# XCFramework
xcodebuild -create-xcframework \
  -framework $OUTPUT/ios.xcarchive/Products/Library/Frameworks/$SCHEME.framework \
  -framework $OUTPUT/sim.xcarchive/Products/Library/Frameworks/$SCHEME.framework \
  -output $OUTPUT/$SCHEME.xcframework
