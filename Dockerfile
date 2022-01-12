FROM library/openjdk:8

# SETUP
RUN mkdir -p /opt/android/sdk && mkdir .android
RUN cd /opt/android/sdk && curl -o sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && unzip sdk.zip && rm sdk.zip
RUN yes | /opt/android/sdk/tools/bin/sdkmanager --licenses
RUN /opt/android/sdk/tools/bin/sdkmanager --update > /dev/null
RUN /opt/android/sdk/tools/bin/sdkmanager platform-tools > /dev/null
RUN /opt/android/sdk/tools/bin/sdkmanager tools > /dev/null
RUN /opt/android/sdk/tools/bin/sdkmanager emulator > /dev/null
RUN /opt/android/sdk/tools/bin/sdkmanager "extras;android;m2repository" > /dev/null
RUN /opt/android/sdk/tools/bin/sdkmanager "extras;google;m2repository" > /dev/null
RUN /opt/android/sdk/tools/bin/sdkmanager "extras;google;google_play_services" > /dev/null
RUN /opt/android/sdk/tools/bin/sdkmanager "build-tools;30.0.2" > /dev/null
RUN /opt/android/sdk/tools/bin/sdkmanager "platforms;android-30" > /dev/null
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

ENV ANDROID_HOME="/opt/android/sdk/"
ENV BUILD_TOOLS_VER="30.0.2"
ENV PATH=$PATH:/opt/android/sdk/build-tools/$BUILD_TOOLS_VER
