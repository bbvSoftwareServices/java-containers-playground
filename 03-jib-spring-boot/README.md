# Package a Spring-Boot app using `jib`

This module contains a simple Spring-Boot app that returns some simple json on `localhost:8080/greeting`.

You can use [jib](https://github.com/GoogleContainerTools/jib) as an alternative to writing Dockerfiles.

One of the main advantages of jib is that it does not require docker to build containers, although we _will_ actually use docker to build the image locally.

Additionally, it is built for Java - i.e. it knows how to efficiently cache the build and set appropriate JVM flags.

## Create a container image with `jib`

As mentioned - no Dockerfile! With `jib` we will make use of the [jib-maven-plugin](https://github.com/GoogleContainerTools/jib/tree/master/jib-maven-plugin#build-to-docker-daemon) to build our image.

* First build the artifact using `mvn clean package`.
* Invoke ` mvn compile com.google.cloud.tools:jib-maven-plugin:3.1.4:dockerBuild` and observe the output and warnings:
  * First try to run the generated image. Use `curl -i localhost:8080/greeting` to check that everything is working.
  * How can we specify a different base image? We want to use `eclipse-temurin:17.0.1_12-jdk@sha256:e736c4543a28fddd6dad577a3af011ce62ab2b8edb2e2b605cb8472ded9fb0b4`
  * How can we specify an image-name e.g `jib-spring-boot` ?
  * Explore the other options you can set on your container (JVM-flags, ports,...). The [example](https://github.com/GoogleContainerTools/jib/tree/master/jib-maven-plugin#example) will give you a good starting point.



