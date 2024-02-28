FROM maven:3.8.4-openjdk-11 AS builder
WORKDIR /app
RUN git clone https://github.com/prudwe/sparkjava-war-example.git .
RUN mvn clean package

FROM tomcat:8
COPY --from=builder /app/target/sparkjava-hello-world-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
