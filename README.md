# wildfly-swagger-ui

This is a Dockerfile that extends the base WildFly application server image. It replaces the default Wildfly welcome page with the [Swagger UI](http://swagger.io/swagger-ui/) and allows replacing the default http://petstore.swagger.io/v2/swagger.json with your own URL. This makes it easier to deliver a Swagger UI along with your REST microservice based on Wildfly. The user just enters the domain (like "http://localhost:8080") and the Swagger UI with your URL will show up.

## Versions

Wildfly 10.1.0.Final
Swagger UI 2.2.6

## Usage

The usage is exactly as described in the [Wildfly Docker documentation](https://github.com/JBoss-Dockerfiles/wildfly). The only difference is that you can pass an additional parameter *SWAGGER_API_URL* that sets the Swagger UI default URL.

    docker run -it -e SWAGGER_API_URL="http://localhost:8080/api" -p 8080:8080 fuinorg/wildfly-swagger-ui

This allows setting the URL to the current domain at startup.

## Extending the image

When you create your own microservice's docker image, you can also override the URL by setting the *SWAGGER_API_URL* environment variable.

    FROM fuinorg/wildfly-swagger-ui
    ENV SWAGGER_API_URL http://any-domain-you-want.xyz/api

