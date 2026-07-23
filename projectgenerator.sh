#!/bin/bash

if [[ $1 == "" && $2 == "" ]]; then
    echo "No!"
    exit 1
fi

echo "Template: $1"
echo "Project : $2"

PROJECT_NAME="$2"
mkdir "$PROJECT_NAME"

create_web(){
    cd $PROJECT_NAME
    touch index.html
    
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

case "$1" in
    "web")
        create_web
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