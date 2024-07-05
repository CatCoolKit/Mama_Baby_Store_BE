# Sử dụng OpenJDK 17 làm base image cho giai đoạn build
FROM openjdk:17-jdk AS build

# Sao chép mã nguồn ứng dụng vào container
COPY . /app
WORKDIR /app

# Cài đặt Maven và các phụ thuộc cần thiết
RUN apt-get update && apt-get install -y maven

# Biên dịch và xây dựng dự án sử dụng Maven, sử dụng cache mount
RUN --mount=type=cache,id=s/061a13a1-ae8a-4ccd-8e8b-e20e0b403b71-m2/repository,target=/root/.m2 mvn -DoutputFile=target/mvn-dependency-list.log -B -DskipTests clean dependency:list install

# Giai đoạn cuối cùng, sử dụng JRE để giảm kích thước hình ảnh
FROM openjdk:17-jdk
COPY --from=build /app/target/*.jar /app/app.jar
CMD ["java", "-jar", "/app/app.jar"]
