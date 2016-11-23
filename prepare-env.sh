#!/bin/sh
# Copies the Swagger UI files into Wildfly's welcome directory

SWAGGER_TARGET_DIR=$JBOSS_HOME/welcome-content

# Copy the Swagger UI files into Wildfly's welcome directory
rm -R $SWAGGER_TARGET_DIR/*
cp -n -R $SWAGGER_TMP_DIR/* $SWAGGER_TARGET_DIR

# Replace the default Swagger URL with the content of 
# the environment variable SWAGGER_API_URL
sed -i -- 's|http://petstore.swagger.io/v2/swagger.json|'$SWAGGER_API_URL'|g' $SWAGGER_TARGET_DIR/*.js $SWAGGER_TARGET_DIR/*.html
chown -R jboss:jboss $SWAGGER_TARGET_DIR

# Execute Wildfly
(exec "$1" "${@:2}")
