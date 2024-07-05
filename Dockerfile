# Sử dụng OpenJDK 21 làm base image
FROM openjdk:21-jdk

# Đặt thư mục làm việc trong container
WORKDIR /app

# Sao chép nội dung hiện tại vào thư mục làm việc trong container
COPY . /app

# Cập nhật danh sách package và cài đặt Maven
RUN apt-get update && apt-get install -y maven

# Kiểm tra phiên bản JDK
RUN java -version

# Kiểm tra phiên bản Maven
RUN mvn -version

# Chạy Maven để build project
RUN --mount=type=cache,id=s/f0f4d90e-2eb3-4f98-8aec-4521f9d0e52f-m2/repository,target=/app/.m2/repository mvn -DoutputFile=target/mvn-dependency-list.log -B -DskipTests clean dependency:list install
