FROM ubuntu:latest

RUN apt update && \
    apt install net-tools -y && \
    apt install openssh-server -y && \
    apt install openjdk-11-jdk wget && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/sshd

EXPOSE 80 22 443

WORKDIR /usr/local/
COPY sshd_config /etc/ssh/sshd_config

RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz && \
    tar xvf apache-tomcat-9.0.85.tar.gz && \
    mv apache-tomcat-9.0.85.tar.gz && \
    rm -rf apache-tomcat-9.0.85.tar.gz

ENV CATALINA_HOME=/usr/local/tomcat
ENV PATH="$CATALINA_HOME/bin:$PATH"

CMD service ssh restart && catalina.sh run
    


