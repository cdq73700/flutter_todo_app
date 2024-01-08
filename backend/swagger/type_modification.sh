#!/bin/bash

# 型の修正をするスクリプト

version=v1

content="ErrorSchema error = null;"
change_content="ErrorSchema? error;"
error_schema_file_path="/docker/swagger/output/$version/dart/lib/model/response_error_schema.dart"
sed -i "s/$content/$change_content/g" $error_schema_file_path
echo "response_error_schema.dart 内の型を修正しました"