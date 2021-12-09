FROM eclipse-temurin:17.0.1_12-jdk@sha256:e736c4543a28fddd6dad577a3af011ce62ab2b8edb2e2b605cb8472ded9fb0b4

RUN mkdir /opt/app

COPY target/01-simple-app-1.0-SNAPSHOT.jar /opt/app/app.jar

EXPOSE 8080

CMD ["java", "-jar", "/opt/app/app.jar"]