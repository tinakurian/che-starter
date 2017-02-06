FROM centos:7

ARG VERSION
ENV VERSION ${VERSION:-1.0-SNAPSHOT}

RUN yum update -y && \
    yum install -y \
       java-1.8.0-openjdk \
       java-1.8.0-openjdk-devel

ENV JAVA_HOME /etc/alternatives/jre

EXPOSE 10000

VOLUME /tmp

ADD target/che-starter-${VERSION}.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]