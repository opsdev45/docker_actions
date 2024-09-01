# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/my-app.jar my-app.jar

# Run the JAR file
CMD ["java", "-jar", "my-app.jar"]
