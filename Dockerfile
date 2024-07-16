FROM openjdk:17
VOLUME /tmp
EXPOSE 8761
ADD ./target/gatewayZull-0.0.1-SNAPSHOT.jar gatewayZull.jar

# Comando para rodar o serviço 
ENTRYPOINT ["java", "-jar", "gatewayzull.jar"]