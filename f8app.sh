#!/usr/bin/env bash

# http://makeitopen.com/tutorials/building-the-f8-app/local-setup/
cd ..
git clone https://github.com/fbsamples/f8app.git
cd f8app
yarn
# npm start 
# npm run import-data
# react-native run-android
# adb reverse tcp:8081 tcp:8081   # required to ensure the Android app can
# adb reverse tcp:8080 tcp:8080   # access the Packager


