FROM openjdk:8-jre-slim
WORKDIR /home
COPY target/spring-h2-demo.jar /app/spring-h2-demo.jar
COPY src/main/resources/* /user/src/app/
EXPOSE 8000
ENTRYPOINT ["java", "-jar", "/app/spring-h2-demo.jar"]
