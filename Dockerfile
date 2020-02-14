FROM maven:3.6.3-jdk-8

ENV DOCKER_HOST=unix:///var/run/docker.sock

RUN apt-get update
RUN apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get install docker-ce docker-ce-cli containerd.io -y
RUN dockerd --version
RUN docker --version
