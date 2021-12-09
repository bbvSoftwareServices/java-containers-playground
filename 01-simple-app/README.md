# A simple webserver with no dependencies

This module contains a very simple Java-app that starts a `com.sun.net.httpserver.HttpServer` on `localhost:8080` and responds some simple json at `localhost:8080/hello`.

## 1. Beginner: Package the app as a container and ensure it is running

First build the artifact by invoking  `mvn clean package`

Your task is to package the resulting `target/01-simple-app-1.0-SNAPSHOT.jar` as a container.

If you get stuck `solution.Dockerfile` is there to help you.

## 2. Advanced: Build a custom Java Runtime with `jlink`

`jlink` gives us the option to build custom Java runtimes with only the modules we actually need. This will reduce the size of your image by quite a bit. This is the modern equivalent to the legacy (up until JDK8) `JRE` approach.

Gunnar Morling [has a great article on this topic](https://www.morling.dev/blog/smaller-faster-starting-container-images-with-jlink-and-appcds/).

`jlinksolution.Dockerfile` gives an option on how to do this. It is not complete or perfect but illustrates the purpose.

Try and compare the size of the images. You will notice quite an improvement.