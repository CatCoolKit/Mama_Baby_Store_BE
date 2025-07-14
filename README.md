# Mama Baby Store Backend

This is the backend service for the Mama Baby Store, an e-commerce platform for baby and mother products. The project is built with Spring Boot and provides a RESTful API for managing users, products, orders, stores, payments, and more.

## Features

- User registration, authentication (JWT), and profile management
- Product catalog with categories, brands, and age ranges
- Store management and store packages
- Order and order detail management
- Exchange and refund processing
- Article/blog management
- Voucher and discount management
- Payment integration (VNPay)
- Role-based access control (Admin, Staff, Member)
- Comment and review system
- OpenAPI/Swagger documentation

## Tech Stack

- Java 17
- Spring Boot 3.x
- Spring Security (JWT)
- Spring Data JPA (MySQL)
- Maven
- Docker
- Lombok
- OpenAPI/Swagger

## Getting Started

### Prerequisites

- Java 17+
- Maven 3.6+
- MySQL database
- (Optional) Docker

### Environment Variables

The application uses environment variables for database and some configuration. You can set them in your environment or use a `.env` file with Docker Compose.

- `PROD_DB_HOST` - MySQL host (e.g., `localhost`)
- `PROD_DB_PORT` - MySQL port (default: `3306`)
- `PROD_DB_NAME` - Database name
- `PROD_DB_USERNAME` - Database username
- `PROD_DB_PASSWORD` - Database password

Other configuration (see `src/main/resources/application.yml` for more):

- `jwt.secretKey` - JWT secret key
- `jwt.expiration` - JWT expiration (seconds)
- VNPay payment keys (see `application.yml`)

### Database Setup

1. Create a MySQL database and user.
2. Grant privileges to the user.
3. Set the environment variables as above.
4. The application will auto-create/update tables on startup (see `spring.jpa.hibernate.ddl-auto: update`).

### Build and Run (Local)

```bash
# Build the project
./mvnw clean package

# Run the application
java -jar target/*.war
```

The server will start on port 8080 by default.

### Run with Docker

```bash
docker build -t mamababy-backend .
docker run -p 8080:8080 --env-file .env mamababy-backend
```

## API Documentation

- OpenAPI/Swagger UI: [http://localhost:8080/swagger-ui/index.html](http://localhost:8080/swagger-ui/index.html)
- API base path: `/mamababy`

## Main API Endpoints

- `POST   /mamababy/users/register` - Register a new user
- `POST   /mamababy/users/login` - User login (returns JWT)
- `GET    /mamababy/products` - List products
- `POST   /mamababy/products` - Create product (admin/staff)
- `GET    /mamababy/orders` - List orders (user)
- `POST   /mamababy/orders` - Create order
- `GET    /mamababy/stores` - List stores
- `POST   /mamababy/stores` - Create store
- `POST   /mamababy/payment/vn-pay` - VNPay payment
- ...and more for categories, brands, comments, articles, vouchers, etc.

## Testing

- Unit and integration tests are in `src/test/java`
- Run tests with:

```bash
./mvnw test
```

## License

This project is for educational/demo purposes.
