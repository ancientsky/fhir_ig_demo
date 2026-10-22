#!/bin/bash
# 以 HL7 FHIR IG Publisher 建置本實作指引一次。
# 用法：./_genonce.sh [-tx n/a]   (傳入參數會直接轉給 IG Publisher，例如離線建置時使用 -tx n/a)
set -e
publisher_jar=publisher.jar
input_cache_path=./input-cache

if [ ! -f "$input_cache_path/$publisher_jar" ]; then
  if [ -f "../$publisher_jar" ]; then
    publisher=../$publisher_jar
  else
    echo "IG Publisher not found; downloading ..."
    ./_updatePublisher.sh
    publisher=$input_cache_path/$publisher_jar
  fi
else
  publisher=$input_cache_path/$publisher_jar
fi

echo "Using $publisher"
java ${JAVA_OPTS:--Xmx4g} -Dfile.encoding=UTF-8 -jar "$publisher" -ig . "$@"
