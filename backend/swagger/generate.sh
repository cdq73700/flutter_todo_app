#!/bin/bash

codegen=/docker/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar
path=/docker/swagger
version=v1
apipath=/docker/swagger/Api.yaml
outputh=$path/output/$version
template=/docker/swagger/template

rm -rf $outputh/$version

java -jar $codegen generate \
    -i $apipath \
    -l typescript-angular \
    -o $outputh/typescript \
    -D models 

java -jar $codegen generate \
    -i $apipath \
    -l dart \
    -o $outputh/dart \
    -D models \
    -t $template

java -jar $codegen generate \
    -i $apipath \
    -l openapi-yaml \
    -o $outputh/yaml

./import_addition.sh