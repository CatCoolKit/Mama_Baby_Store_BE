# Build stage
FROM maven:3-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

RUN ls -la /app/target

# Run stage
FROM openjdk:17-jdk-slim
WORKDIR /app

COPY --from=build /app/target/*.war /app/drcomputer.war

RUN ls -la /app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/drcomputer.war"]
