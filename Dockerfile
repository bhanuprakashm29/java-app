FROM maven:3.8.6-openjdk-11 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:11-jre
COPY --from=build /app/target/java-app-1.0-SNAPSHOT.jar /usr/local/lib/java-app.jar
ENTRYPOINT ["java", "-jar", "/usr/local/lib/java-app.jar"]
