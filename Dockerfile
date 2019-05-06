FROM maven:3.6.1-jdk-11-slim as build
WORKDIR /app
COPY pom.xml /app
COPY /src /app/src
RUN mvn install

FROM openjdk:11.0.3-jdk-slim
WORKDIR /app
COPY --from=build /app/target/awsik-0.0.1-SNAPSHOT.jar /app
EXPOSE 8080
CMD ["java -jar awsik-0.0.1-SNAPSHOT.jar"]