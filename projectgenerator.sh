#!/bin/bash

if [[ $1 == "" && $2 == "" ]]; then
    echo "No!"
    exit 1
fi

echo "Template: $1"
echo "Project : $2"

