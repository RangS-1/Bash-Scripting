#!/bin/bash

if [[ $1 == "" && $2 == "" ]]; then
    echo "No!"
    exit 1
fi

echo "Template: $1"
echo "Project : $2"

TEMPLATE="$1"

PROJECT_NAME="$2"
mkdir "$PROJECT_NAME"

create_web(){
    cd $PROJECT_NAME
    
    cat << EOF > index.html
<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" href="css/style.css">
    <title>Website</title>
</head>
<body>
    <h1>Title</h1>

    <script src="js/script.js"></script>
</body>
</html>
EOF

    mkdir css && cd css
    cat << EOF > style.css
:root{
    color: white;
}
EOF

    cd ..
    mkdir js && cd js
    cat << EOF > script.js
let element = document.getElementById('id');
EOF
}

create_python(){
    cd $PROJECT_NAME
    cat << EOF > README.md
# Readme
This is Python Project
EOF

    mkdir src && cd src
    mkdir appname && cd appname

    cat << EOF > main.py
def main():
    print("Hello World!")

if __name__ == "__main__":
    main()
EOF
    cat << EOF > __init__.py
EOF
}

case "$TEMPLATE" in
    "web")
        create_web
        exit 1
        ;;
    "python")
        create_python
        exit 1
        ;;
    "php")
        echo "PHP"
        exit 1
        ;;
esac