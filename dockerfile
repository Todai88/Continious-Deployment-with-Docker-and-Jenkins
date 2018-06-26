FROM jenkins:2.7.2-alpine

USER root
RUN   apk update \
      && apk add sudo \
      && apk add curl \
      && apk add go \
      && rm -rf /var/lib/apt/lists/*

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /var/jenkins_home

USER jenkins

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
