# Используем официальный образ с JDK 17
FROM openjdk:17-jdk-slim

# Указываем рабочую директорию
WORKDIR /app

# Копируем JAR-файл в контейнер
COPY target/diploma-0.0.1-SNAPSHOT.jar app.jar

# Открываем порт
EXPOSE 8080

# Команда запуска
ENTRYPOINT ["java", "-jar", "app.jar"]