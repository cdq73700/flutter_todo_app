#!/bin/bash

# ファイルに Dart モデルのインポート文を追加するスクリプト

version=v1

error_schema_content="import './error_schema.dart';\n"
error_schema_file_path="/docker/swagger/output/$version/dart/lib/model/response_error_schema.dart"
sed -i "3i $error_schema_content" $error_schema_file_path
echo "インポート文を response_error_schema.dart に追加しました"

task_schema_content="import './task_schema.dart';\n"
task_schema_file_path="/docker/swagger/output/$version/dart/lib/model/response_task_schema.dart"
sed -i "3i $task_schema_content" $task_schema_file_path
echo "インポート文を response_task_schema.dart に追加しました"
