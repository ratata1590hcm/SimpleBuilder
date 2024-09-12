FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
ENV HOME=/app
COPY pom.xml .
COPY .m2 .
RUN mvn dependency:go-offline -s /app/settings.xml
COPY . .
RUN mvn clean package
USER daemon

FROM openjdk:21
USER daemon
WORKDIR /app
COPY --from=build /app/target/app-jar-with-dependencies.jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "java", "--version" ]