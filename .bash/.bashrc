function version(){

    echo "git >" 
    git --version 2.43.0 && echo
    
    echo "node >" 
    node --version 20.11.0 && echo

    echo "code >" 
    code --version 1.91.1 && echo

    echo "flutterfire >" 
    flutterfire --version 1.0.0 && echo
    
    echo "nvm >" 
    nvm --version 1.1.12  && echo

    echo "npm >" 
    npm --version 10.4.0 && echo

    echo "firebase >" 
    firebase --version 13.13.3 && echo
    
    echo "flutter >" 
    flutter --version 3.22.2 && echo
}

function namespace(){

    if [ ! -f "$(dirname  $PWD)/.namespace/$1.sh" ]; then
        echo "Informe o nome do arquivo que encontra-se na pasta .namespace sem a extensão!"
        return
    fi

    source "$(dirname  $PWD)/.namespace/$1.sh"

    loadFile

    replaceFile
}

function loadFile(){
    ARRAY_FILE=(
        "$PWD"/lib/main.dart
        "$PWD"/android/app/build.gradle
        "$PWD"/android/app/src/main/AndroidManifest.xml
        "$PWD"/android/app/src/main/kotlin/MainActivity.kt
    )

    ARRAY_FILE_TEMPLATE=(
        "$PWD"/lib/main_template
        "$PWD"/android/app/build_template
        "$PWD"/android/app/src/main/AndroidManifest_template
        "$PWD"/android/app/src/main/kotlin/MainActivity_template
    )
}

function replaceFile(){
    for INDEX  in "${!ARRAY_FILE[@]}"; do
        FILE="${ARRAY_FILE[INDEX]}"
        FILE_TEMPLATE="${ARRAY_FILE_TEMPLATE[INDEX]}"

        FILE_PATH="${FILE%.*}"
        FILE_PATH_TEMPLATE="${FILE_TEMPLATE//_template}"

        if [ "$FILE_PATH" != "$FILE_PATH_TEMPLATE" ]; then
            echo "Caminhos diferentes!"
            echo "$FILE_PATH"
            echo "$FILE_PATH_TEMPLATE"
            continue
        fi

        if [ ! -f "$FILE_TEMPLATE" ]; then
            echo "Arquivo inexiste!"
            echo "$FILE_TEMPLATE"
            continue
        fi
        
        CONTENT=$(<"$FILE_TEMPLATE")

        if [ ! -n "$CONTENT" ]; then
            echo "Arquivo sem conteúdo:"
            echo "$FILE_TEMPLATE"
            continue
        fi

        CONTENT="${CONTENT//\{\{ICON\}\}/${ANDROID[ICON]}}"
        CONTENT="${CONTENT//\{\{ID\}\}/${ANDROID[ID]}}"
        CONTENT="${CONTENT//\{\{ID\}\}/${ANDROID[IMPORT]}}"
        CONTENT="${CONTENT//\{\{LABEL\}\}/${ANDROID[LABEL]}}"
        CONTENT="${CONTENT//\{\{TITLE\}\}/${ANDROID[TITLE]}}"
        CONTENT="${CONTENT//\{\{URI\}\}/${ANDROID[URI]}}"
        echo "$CONTENT" > "$FILE"
    done
}

function moveFile(){
    DIR_BACKUP="$PWD/.backup"
    DIR_BASE=$(find "$PWD/android/app/src/main/kotlin/"* -type d | head -n 1)
    DIR_INPUT=$(find "$PWD/android/app/src/main/kotlin/" -type d | tail -n 1)
    DIR_OUTPUT="$PWD/android/app/src/main/kotlin/${ANDROID[ID]//./\/}"

    cp -r "$DIR_INPUT" "$DIR_BACKUP"
    rm -r "$DIR_BASE"
    mkdir -p "$DIR_OUTPUT"
    mv "$DIR_BACKUP"/* "$DIR_OUTPUT"
    rm -r "$DIR_BACKUP"
}

function environment(){

    for var in $(compgen -v); do
        echo "$var=${!var}"
    done
}
