# Documentation of Jenkins https://pkg.jenkins.io/debian/
FROM debian:stable-slim

# Error in installation of JAVA JRE 11.
# https://stackoverflow.com/questions/58160597/docker-fails-with-sub-process-usr-bin-dpkg-returned-an-error-code-1
RUN mkdir -p /usr/share/man/man1

RUN apt-get update \
    && apt-get install -y \
    unzip \
    default-jre \
    wget \
    gnupg gnupg1 gnupg2 

# Adding Public Key to be able to validate the new source
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -

# Adding a entry of Jenkins on sources.list file
RUN echo "deb https://pkg.jenkins.io/debian binary/" >> /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y jenkins