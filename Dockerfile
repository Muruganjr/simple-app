# Use the latest OpenJDK image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the packaged war file into our docker image
COPY target/simple-app-3.0.0-SNAPSHOT.war /usr/src/app/app.war

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "app.war"]
