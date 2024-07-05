# Sử dụng OpenJDK 17 để build ứng dụng
FROM openjdk:17-jdk AS build

# Bước build ở đây

# Giai đoạn cuối, sử dụng JDK để build JAR và sau đó sử dụng JRE để giảm kích thước ảnh
FROM openjdk:17-jdk

# Copy JAR từ giai đoạn build trước vào ảnh mới
COPY --from=build /app/target/*.jar /app/app.jar

# CMD để chạy ứng dụng
CMD ["java", "-jar", "/app/app.jar"]
