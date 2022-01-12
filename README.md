ANDROID BUILDER
===============

- JAVA 8
- ANDROID SDK TOOLS
- NODE 14.x


# USAGE

```
docker run -it -v `pwd`:/app skillibillsrl/android-builder:latest /bin/bash
> cd /app
> ./gradlew assembleRelease 
```