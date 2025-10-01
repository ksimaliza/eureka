
# Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
# Click nbfs://nbhost/SystemFileSystem/Templates/Other/Dockerfile to edit this template

# Usamos la imagen de OpenJDK 17 (o la versión que uses)
FROM openjdk:21-jdk-slim

# Directorio de la aplicación dentro del contenedor
WORKDIR /app

# Copiamos el archivo jar generado por Maven
COPY target/euraka-0.0.1-SNAPSHOT.jar app.jar

# Puerto en el que corre la aplicación
EXPOSE 8761

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]
