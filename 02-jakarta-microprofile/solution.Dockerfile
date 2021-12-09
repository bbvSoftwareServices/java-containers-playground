FROM payara/server-full:5.2021.9-jdk11

COPY target/02-jarkarta-microprofile.war $DEPLOY_DIR

