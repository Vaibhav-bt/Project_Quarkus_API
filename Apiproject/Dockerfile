FROM registry.access.redhat.com/ubi8/openjdk-17:1.17

ENV LANGUAGE='en_US:en'

COPY --chown=185 target/quarkus-app/lib/ /deployments/lib/
COPY --chown=185 target/quarkus-app/*.jar /deployments/
COPY --chown=185 target/quarkus-app/app/ /deployments/app/
COPY --chown=185 target/quarkus-app/quarkus/ /deployments/quarkus/

EXPOSE 8080

ENV JAVA_OPTS_APPEND="-Dquarkus.http.host=0.0.0.0"
ENV JAVA_APP_JAR="/deployments/quarkus-run.jar"

USER 185
ENTRYPOINT [ "/opt/jboss/container/java/run/run-java.sh" ]
