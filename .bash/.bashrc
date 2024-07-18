function environment(){
    for var in $(compgen -v); do
        echo "$var=${!var}"
    done
}

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