FROM openjdk:19-alpine
MAINTAINER Marwan Attar
EXPOSE 8080
COPY target/cicd-springboot-app-0.0.1-SNAPSHOT.jar cicd-springboot-app.jar
ENTRYPOINT ["java","-jar","/cicd-springboot-app.jar"]
