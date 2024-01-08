#!/bin/bash

# schema を flutter 内に移動するスクリプト

path=/docker/swagger/flutter
version=v1
outpath=$path/$version

rm -rf $outpath

docs=/docker/swagger/output/$version/dart/docs
model=/docker/swagger/output/$version/dart/lib/model

mv $docs $outpath
echo "docs を移動しました"

mv $model $outpath
echo "schema を移動しました"

rm -rf /docker/swagger/output/$version/dart