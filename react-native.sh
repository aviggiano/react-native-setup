#!/usr/bin/env bash

ANDROID_STUDIO_URL="https://dl.google.com/dl/android/studio/ide-zips/2.3.0.8/android-studio-ide-162.3764568-linux.zip"

# http://facebook.github.io/react-native/docs/getting-started.html
## 1
sudo npm install -g react-native-cli

# https://developer.android.com/studio/index.html
cd ~/Documents
wget "$ANDROID_STUDIO_URL" -O android-studio.zip
unzip android-studio.zip
rm android-studio.zip
cd android-studio/bin
sudo ln -s $(pwd)/studio.sh /usr/bin/android-studio 

# https://developer.android.com/studio/install.html
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

## 2
## 3
## 4
echo "export ANDROID_HOME=\${HOME}/Android/Sdk" >> ~/.bash_custom
echo "export PATH=\${PATH}:\${ANDROID_HOME}/tools" >> ~/.bash_custom
echo "export PATH=\${PATH}:\${ANDROID_HOME}/platform-tools" >> ~/.bash_custom

# gradle
# https://facebook.github.io/react-native/docs/signed-apk-android.html
mkdir ~/.gradle
echo "MYAPP_RELEASE_STORE_FILE=my-release-key.keystore" >> ~/.gradle/gradle.properties
echo "MYAPP_RELEASE_KEY_ALIAS=my-key-alias" >> ~/.gradle/gradle.properties
echo "MYAPP_RELEASE_STORE_PASSWORD=$(get_random_password)" >> ~/.gradle/gradle.properties
echo "MYAPP_RELEASE_KEY_PASSWORD=$(get_random_password)" >> ~/.gradle/gradle.properties

# https://discuss.circleci.com/t/android-build-tools-23-0-2-not-available/455
# adb reverse tcp:8081 tcp:8081
