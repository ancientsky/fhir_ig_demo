#!/bin/bash
# 下載(或更新) HL7 FHIR IG Publisher 至 input-cache/publisher.jar
set -e
pubsource=https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar
publisher_jar=publisher.jar
dlurl=$pubsource

input_cache_path=./input-cache
mkdir -p "$input_cache_path"

echo "Downloading IG Publisher from $dlurl ..."
curl -fL "$dlurl" -o "$input_cache_path/$publisher_jar" --create-dirs
echo "IG Publisher saved to $input_cache_path/$publisher_jar"
