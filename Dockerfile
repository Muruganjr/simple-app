# Use the OpenJDK 17 official image
FROM openjdk:17-jdk-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper
COPY mvnw .
COPY .mvn .mvn

# Copy the Project Object Model (POM) file
COPY pom.xml .

# Copy the source code
COPY src src

# Build the application
RUN ./mvnw install -DskipTests

# Use AdoptOpenJDK 17 with HotSpot JRE on Alpine Linux
FROM adoptopenjdk:17-jre-hotspot AS production

# Set the working directory in the container
WORKDIR /app

# Copy the executable JAR file from the build stage to the production stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
