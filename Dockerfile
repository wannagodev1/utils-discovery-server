FROM openjdk:8-jre-alpine

MAINTAINER Wannago Dev1 <Wannago.dev1@gmail.com>

RUN apk --no-cache add curl

ENV JAVA_OPTS=""

ADD target/utils-discovery-server.jar /app/

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app/utils-discovery-server.jar --spring.application.name=$spring_application_name"]

HEALTHCHECK --interval=30s --timeout=30s --retries=10 CMD curl -f http://localhost:$spring_application_actuator_port/actuator/health || exit 1

EXPOSE 8761 9761