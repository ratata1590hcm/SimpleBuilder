FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
ENV HOME=/app
COPY pom.xml .
COPY .m2 .
RUN mvn dependency:go-offline
COPY . .
RUN mvn clean package
RUN ls -la target

FROM openjdk:21
WORKDIR /app
COPY --from=build /app/target/app-all.jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "java", "--version" ]