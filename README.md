# Java containers playground

This repository is intended to serve as a starting point for learning how to containerize Java applications.

It is not complete or perfect - just a playground to reduce boilerplate. Contributions are always welcome :)

## Requirements

* JDK 17 or higher
* Docker (or if you are more advanced an alternative solution like `podman`. The `jib` example might not work this way though)
* Maven

## Getting started

* Clone the repo and import the top-level `pom.xml` in your favourite IDE or editor.
* Make sure you can actually build the project by invoking `mvn clean install`

## Topics / Organisation

| Module                  | Description                                                                                                                            |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 01-simple-app           | A simple webserver with no dependencies just to get you started. Can be spiced up by using `jlink`.                                    |
| 02-jakarta-microprofile | Shows how to package a `war` file with an application server as a container                                                            |
| 03-jib-spring-boot      | Package a Spring Boot app without Dockerfiles but with `jib` instead                                                                   |
## JVM-Specific features to reduce image size and improve startup time

There are two main tools at our disposal

### Jlink (since JDK9)

`jlink` gives us the option to create a custom Java runtime using only the modules our application _acutally uses_. A common missconception is that your app needs to be fully modularized for that (i.e. it runs on the module path). That's acutally *not necessary*.

The [01-simple-app](./01-simple-app) project gives you a starting point to explore this option. Play around with it - e.g. try adding some different JDK classes and see what happens.

### Application Class-Data Sharing (JEPs 310, 351 and 350)

The main goal of Application class-data sharing (short `AppCDS`) is to reduce startup time by pre-creating an archive of the classes that have to be loaded and verified by the JVM. This archive can be passed at startup and thus reduce the amount of work the JVM has to perform.

Gunnar Morling has published an interesting Article about [using AppCDS with Maven](https://www.morling.dev/blog/building-class-data-sharing-archives-with-apache-maven/)

For a deeper understanding check out this [In-depth article about AppCDS by Nicolai Parlog](https://nipafx.dev/java-application-class-data-sharing/)

### Combining `jlink` and `AppCDS`

You can of course combine the power of `jlink` and `AppCDS`. [This Article](https://www.morling.dev/blog/smaller-faster-starting-container-images-with-jlink-and-appcds/) will give you some guidance and also show some benchmarks at the end.

## Frameworks and containers

Another interesting topic is how modern Frameworks can help with the creation of container images.

### Spring Boot

Spring Boot uses [Cloud native buildpacks](https://buildpacks.io/) to create OCI compliant containers. All managed through the [spring-boot-maven-plugin](https://docs.spring.io/spring-boot/docs/2.5.6/maven-plugin/reference/htmlsingle/#build-image). No Dockerfiles required!

[This article (DE)](https://www.heise.de/hintergrund/Container-Images-Abschied-vom-Dockerfile-5997535.html) gives a great overview, very much recommended

Get started at [start.spring.io](https://start.spring.io/)

### Quarkus

New quarkus projects come with a couple of predefined Dockerfiles, one of them builds a custom Runtime with jlink. Quarkus also has [out-of-the-box support](https://quarkus.io/guides/maven-tooling#quarkus-package-pkg-package-config_quarkus.package.create-appcds) for `AppCDS`


Get started at [code.quarkus.io](https://https://code.quarkus.io/)

### Helidon

Helidon provides - similar to quarkus - predefined Dockerfiles (also with a jlink option) as part of their starter.

Get started at [helidon.io](https://helidon.io/docs/v2/#/mp/guides/02_quickstart)