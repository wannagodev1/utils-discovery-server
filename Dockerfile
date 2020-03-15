FROM openjdk:12-jdk-oracle

MAINTAINER Wannago Dev1 <Wannago.dev1@gmail.com>

RUN yum update -y && \
    yum clean all

ENV JAVA_OPTS=""
ENV APP_OPTS=""

ADD target/utils-discovery-server.jar /app/

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app/utils-discovery-server.jar --spring.application.name=$spring_application_name $APP_OPTS"]

HEALTHCHECK --interval=30s --timeout=30s --retries=10 CMD curl -f http://localhost:$spring_application_actuator_port/actuator/health || exit 1

EXPOSE 8761 9761