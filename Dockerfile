FROM maven:3-eclipse-temurin-17 AS build
COPY ./ /home/app
RUN cd /home/app && mvn clean package -Dmaven.test.skip=true
FROM eclipse-temurin:17-alpine
COPY --from=build /home/app/target/AjiNavi-0.0.1-SNAPSHOT.jar /usr/local/lib/AjiNavi.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/local/lib/AjiNavi.jar"]