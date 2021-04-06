# Documentation of Jenkins https://pkg.jenkins.io/debian/
# To create this Dockerfile, we take as a reference the version:
# jenkins/jenkins:lts-slim

FROM debian:stable-slim

USER root

# Error in installation of JAVA JRE 11.
# https://stackoverflow.com/questions/58160597/docker-fails-with-sub-process-usr-bin-dpkg-returned-an-error-code-1
RUN mkdir -p /usr/share/man/man1

RUN apt-get update \
    && apt-get install -y \
    tail \
    unzip \
    default-jre \
    wget \
    gnupg gnupg1 gnupg2 \
    git git-lfs \
    curl \
    libfreetype6 libfontconfig1

# Adding Public Key to be able to validate the new source
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -

# Adding a entry of Jenkins on sources.list file
RUN echo "deb https://pkg.jenkins.io/debian binary/" >> /etc/apt/sources.list

RUN apt-get update \
    && git lfs install \
    && apt-get install -y jenkins \
    && rm -rf /var/lib/apt/lists/*

USER jenkins

EXPOSE 8000 50000

ENV JENKINS_HOME                /var/jenkins_home
ENV JENKINS_UC                  https://updates.jenkins.io
ENV JENKINS_SLAVE_AGENT_PORT    50000
ENV REF                         /usr/share/jenkins/ref

# VOLUME [/var/jenkins_home]

# Arguments that if they are not specified will take this value as default
ARG http_port=8000
ARG agent_port=50000
ARG user=jenkins

CMD service jenkins start && tail -F /var/log/jenkins/jenkins.log