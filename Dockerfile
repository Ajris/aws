FROM maven:3.6.1-jdk-11-slim AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM tomcat:9.0.19-jre11-slim
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/awsik*.jar $CATALINA_HOME/webapps/awsik.jar