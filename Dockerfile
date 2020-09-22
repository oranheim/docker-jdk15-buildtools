FROM debian:buster-slim

#RUN apt-get update; \
#    apt-get install -y wget curl tar gzip bash perl git java-common libasound2 libxi6 libxtst6 libxrender1 libfontconfig1; \
#    rm -rf /var/lib/apt/lists/*;


# Install JDK
#
# Download URL: https://cdn.azul.com/zulu/bin/zulu15.27.17-ca-jdk15.0.0-linux_amd64.deb
#
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ARG ZULU_VER="zulu15.27.17-ca-jdk15.0.0-linux_amd64"

RUN apt-get -qq update && \
    apt-get -qq -y --no-install-recommends install gnupg software-properties-common locales wget curl java-common libasound2 libxi6 libxtst6 libxrender1 libfontconfig1 && \
    locale-gen en_US.UTF-8 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9 && \
    curl -sLO https://cdn.azul.com/zulu/bin/${ZULU_VER}.deb && dpkg -i ${ZULU_VER}.deb && \
    apt-get -qq update && \
    apt-get -qq -y dist-upgrade && \
    mkdir -p /usr/share/man/man1 && \
    apt-get -qq -y --no-install-recommends install zulu-15=15.27.17-* && \
    apt-get -qq -y purge gnupg software-properties-common curl && \
    apt -y autoremove && \
    rm -rf /var/lib/apt/lists/* ${ZULU_VER}.deb

ENV JAVA_HOME=/usr/lib/jvm/zulu15-ca-amd64
