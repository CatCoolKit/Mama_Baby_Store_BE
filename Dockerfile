# Sử dụng OpenJDK 21 làm base image
FROM openjdk:21-jdk

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép file JAR đã được build từ project Spring Boot vào thư mục làm việc trong container
COPY target/your-spring-boot-app.jar /app/app.jar

# Đặt biến môi trường cho cổng mặc định của ứng dụng Spring Boot (nếu cần)
ENV SERVER_PORT=8080

# Cài đặt MySQL
# Lưu ý: Đây chỉ là ví dụ đơn giản, cần cấu hình thêm cho MySQL trong môi trường sản xuất
RUN apt-get update && apt-get install -y mysql-server

# Sao chép script khởi động MySQL vào container (nếu cần)
COPY init-mysql.sh /docker-entrypoint-initdb.d/init-mysql.sh

# Thiết lập entrypoint cho ứng dụng Java Spring Boot
ENTRYPOINT [ "java", "-jar", "app.jar" ]
