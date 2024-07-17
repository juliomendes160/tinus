function environment(){
    for var in $(compgen -v); do
        echo "$var=${!var}"
    done
}

function path(){
    IFS=':'
    for input in $PATH; do
        output=$(cygpath -w "$input")
        echo "$output"
    done
}

function version(){
    echo "code >" 
    code --version 1.91.1 && echo

    echo "firebase >" 
    firebase --version 13.13.3 && echo
    
    echo "flutter >" 
    flutter --version 3.22.2 && echo
    
    echo "flutterfire >" 
    flutterfire --version 1.0.0 && echo
    
    echo "git >" 
    git --version 2.43.0 && echo
    
    echo "node >" 
    node --version 20.11.0 && echo
    
    echo "npm >" 
    npm --version 10.4.0 && echo
    
    echo "nvm >" 
    nvm --version 1.1.12  && echo
}

function android() {

    if [ -z "$1" ]; then
        echo "SETUP <arg>"
        return
    fi

    source $(dirname $PWD)/settings/$1.sh
    
    INPUT_FILE_TEMPLATE=(
        "$PWD/lib/main_template.dart"
        "$PWD/android/app/build_template.gradle"
        "$PWD/android/app/src/main/AndroidManifest_template.xml"
    )

    OUTPUT_FILE=(
        "$PWD/lib/main.dart"
        "$PWD/android/app/build.gradle"
        "$PWD/android/app/src/main/AndroidManifest.xml"
    )

    for INDEX  in "${!INPUT_FILE_TEMPLATE[@]}"; do
        INPUT_FILE_TEMPLATE="${INPUT_FILE_TEMPLATE[INDEX]}"
        OUTPUT_FILE="${OUTPUT_FILE[INDEX]}"
        CONTENT=$(<"$INPUT_FILE_TEMPLATE")
        CONTENT="${CONTENT//\{\{ICON\}\}/${ANDROID[ICON]}}"
        CONTENT="${CONTENT//\{\{ID\}\}/${ANDROID[ID]}}"
        CONTENT="${CONTENT//\{\{LABEL\}\}/${ANDROID[LABEL]}}"
        CONTENT="${CONTENT//\{\{TITLE\}\}/${ANDROID[TITLE]}}"
        CONTENT="${CONTENT//\{\{URI\}\}/${ANDROID[URI]}}"
        echo "$CONTENT" > "$OUTPUT_FILE"
    done
}