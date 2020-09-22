FROM debian:buster-slim

RUN apt-get update; \
    apt-get install -y wget curl tar gzip bash perl git java-common libasound2 libxi6 libxtst6 libxrender1 libfontconfig1; \
    rm -rf /var/lib/apt/lists/*;


# Install JDK
#
# Download URL: https://cdn.azul.com/zulu/bin/zulu15.27.17-ca-jdk15.0.0-linux_amd64.deb
#

ADD "https://cdn.azul.com/zulu/bin/zulu15.27.17-ca-jdk15.0.0-linux_amd64.deb" /jdk.deb

RUN dpkg -i /jdk.deb
RUN update-alternatives --get-selections | grep java
RUN apt-get install -f

#RUN mkdir -p /opt/jdk && tar xzf /jdk.tar.gz --strip-components=1 -C /opt/jdk && rm -f /jdk.tar.gz
#ENV PATH=/opt/jdk/bin:$PATH
#ENV JAVA_HOME=/opt/jdk
