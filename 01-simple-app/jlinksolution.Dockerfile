FROM eclipse-temurin:17.0.1_12-jdk@sha256:e736c4543a28fddd6dad577a3af011ce62ab2b8edb2e2b605cb8472ded9fb0b4 as jre-build

# Create a custom Java runtime with the appropriate modules
# Since this is a very simple app with no dependencies it is quite trvial to do
# To find out which modules you need, simply invoke
# 'jdeps --print-module-deps target/01-simple-app-1.0-SNAPSHOT.jar'
RUN $JAVA_HOME/bin/jlink \
         --add-modules java.base,jdk.httpserver \
         --strip-debug \
         --no-man-pages \
         --no-header-files \
         --compress=2 \
         --output /javaruntime

# Define your base image
FROM debian:buster-slim
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=jre-build /javaruntime $JAVA_HOME

# Continue with your application deployment
COPY target/01-simple-app-1.0-SNAPSHOT.jar /opt/app/app.jar
EXPOSE 8080
CMD ["java", "-jar", "/opt/app/app.jar"]