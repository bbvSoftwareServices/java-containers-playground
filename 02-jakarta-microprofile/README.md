# Jakarta EE / Microprofile App

This module contains a basic JakartaEE/Microprofile app, based on the [JakartaEE-essentials-archetype](https://github.com/AdamBien/JakartaEE-essentials-archetype)
by Adam Bien.

It is intended to demonstrate how to package a `war` artifact to an application server.

## Build the container

First build the artifact by invoking  `mvn clean package`

Your task is to package `target/02-jarkarta-microprofile.war` as a container.

You may use any compatible application server. The `solution.Dockerfile` uses Payara but that is up to you.

If you also want to stick with payara you might want to [check out the payara docs on docker](https://docs.payara.fish/community/docs/documentation/ecosystem/docker-images/server-image-overview.html)




# asdf
docker rm -f 02-jarkarta-microprofile || true && docker run -d -p 8080:8080 -p 4848:4848 --name 02-jarkarta-microprofile eu.bbv.javacontainers/02-jarkarta-microprofile

# System Test
Docs: https://docs.payara.fish/community/docs/documentation/ecosystem/docker-images/server-image-overview.html

