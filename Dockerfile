FROM openjdk:8-jre-slim

ARG version="0.0.0"
COPY target/spring-h2-demo-${version}.jar /app/spring-h2-demo.jar
COPY src/main/resources/* /user/src/app/

EXPOSE 8000
ENTRYPOINT ["java", "-jar", "/app/spring-h2-demo.jar"]

CMD []
