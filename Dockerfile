FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Copy the pom.xml and the source code
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src

# Build
RUN mvn clean package -DskipTests


FROM openjdk:17-slim
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

CMD ["java", "-jar", "app.jar"]
