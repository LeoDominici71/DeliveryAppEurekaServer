FROM maven:3.8.4 AS builder

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17

WORKDIR /app

# Copiar o JAR do serviço eurekaServer para o diretório de trabalho
COPY eurekaServer.jar .

# Define a variável de ambiente para a porta
ENV SERVER_PORT=8761

# Comando para rodar o serviço eurekaServer
ENTRYPOINT ["java", "-jar", "eurekaServer.jar"]