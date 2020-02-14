FROM maven:3.6.3-jdk-8

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
ENTRYPOINT ["dockerd"]
CMD ["docker version"]
CMD ["sh"]
