#!/bin/bash

xcodebuild -workspace weather.xcworkspace \
            -scheme weather \
            -destination platform=iOS\ Simulator,OS=14.4,name=iPhone\ 11 \
            clean test
