#!/bin/bash

codegen=/docker/swagger-codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar
path=/docker/swagger
version=v1
apipath=/docker/swagger/Api.yaml
outpath=$path/output/$version
template=/docker/swagger/template

rm -rf $outpath/$version

java -jar $codegen generate \
    -i $apipath \
    -l typescript-angular \
    -o $outpath/typescript \
    -D models 

java -jar $codegen generate \
    -i $apipath \
    -l dart \
    -o $outpath/dart \
    -D models \
    -t $template

java -jar $codegen generate \
    -i $apipath \
    -l openapi-yaml \
    -o $outpath/yaml

./import_addition.sh

./type_modification.sh

./move_schema.sh