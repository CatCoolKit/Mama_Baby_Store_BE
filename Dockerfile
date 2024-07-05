# Use a compatible JDK version
FROM openjdk:17-jdk AS build

# Copy the application source code
COPY . /app
WORKDIR /app

# Install Maven and other dependencies
RUN apt-get update && apt-get install -y maven

# Compile and build the project using Maven
RUN --mount=type=cache,id=s/061a13a1-ae8a-4ccd-8e8b-e20e0b403b71-m2/repository,target=/app/.m2/repository mvn -DoutputFile=target/mvn-dependency-list.log -B -DskipTests clean dependency:list install

# Final stage, using JRE for smaller image size
FROM openjdk:17-jdk
COPY --from=build /app/target/*.jar /app/app.jar
CMD ["java", "-jar", "/app/app.jar"]

