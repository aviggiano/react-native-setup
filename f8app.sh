#!/usr/bin/env bash

# http://makeitopen.com/tutorials/building-the-f8-app/local-setup/
cd ..
git clone https://github.com/aviggiano/f8app.git
cd f8app
yarn
# npm start 
# npm run import-data
# react-native run-android
# react-native start
# adb reverse tcp:8081 tcp:8081   # required to ensure the Android app can
# adb reverse tcp:8080 tcp:8080   # access the Packager

# https://github.com/ReactWindows/f8app/blob/data/mongodb/db.zip
# http://stackoverflow.com/questions/34243731/mongodb-cannot-start-server-the-default-storage-engine-wiredtiger-is-not-avai
