# Use official base image of Java Runtime
FROM openjdk:17-alpine

# Who is MAINTAINER
MAINTAINER Satib Naenuan, bsatib@gmail.com

# Copy jar file to container
COPY ./target/demo-0.0.1-SNAPSHOT.jar demo-0.0.1-SNAPSHOT.jar

# Set port
EXPOSE 8082

# Run the JAR file
ENTRYPOINT ["java","-jar","/demo-0.0.1-SNAPSHOT.jar"]