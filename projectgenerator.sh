#!/bin/bash

if [[ $1 == "" && $2 == "" ]]; then
    echo "No!"
    exit 1
fi

echo "Template: $1"
echo "Project : $2"

PROJECT_NAME="$2"
mkdir "$PROJECT_NAME"

case "$1" in
    "web")
        echo "Web"
        exit 1
        ;;
    "python")
        echo "Python"
        exit 1
        ;;
    "php")
        echo "PHP"
        exit 1
        ;;
esac