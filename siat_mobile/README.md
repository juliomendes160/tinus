# siat_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Environment Settings

```json

// .vscode\settings.json
{
    "terminal.integrated.defaultProfile.windows": "Git Bash",
    "terminal.integrated.profiles.windows": {
        "Git Bash": {
            "source": "Git Bash",
            "args": ["--rcfile", "${workspaceFolder}/.bash/.bash_profile"],
        }
    },
}

// .vscode\launch.json
{
    // Use o IntelliSense para saber mais sobre os atributos possíveis.
    // Focalizar para exibir as descrições dos atributos existentes.
    // Para obter mais informações, acesse: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "v0\\siat_mobile",
            "cwd": "v0\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v0\\siat_mobile (profile mode)",
            "cwd": "v0\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v0\\siat_mobile (release mode)",
            "cwd": "v0\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v1\\siat_mobile",
            "cwd": "v1\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v1\\siat_mobile (profile mode)",
            "cwd": "v1\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v1\\siat_mobile (release mode)",
            "cwd": "v1\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v2\\siat_mobile",
            "cwd": "v2\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v2\\siat_mobile (profile mode)",
            "cwd": "v2\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v2\\siat_mobile (release mode)",
            "cwd": "v2\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v3\\siat_mobile",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v3\\siat_mobile (profile mode)",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v3\\siat_mobile (release mode)",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v3\\siat_mobile",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v3\\siat_mobile (profile mode)",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v3\\siat_mobile (release mode)",
            "cwd": "v3\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        },
        {
            "name": "v\\siat_mobile",
            "cwd": "v\\siat_mobile",
            "request": "launch",
            "type": "dart"
        },
        {
            "name": "v\\siat_mobile (profile mode)",
            "cwd": "v\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "v\\siat_mobile (release mode)",
            "cwd": "v\\siat_mobile",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        }
    ]
}
```

```sh

# .bash\.bash_profile
PATH="/mingw64/bin:/usr/bin"
PATH="$PATH:/c/Program Files/Git/bin"
PATH="$PATH:/c/Program Files/nodejs"
PATH="$PATH:/c/Users/julio/AppData/Local/Programs/Microsoft VS Code/bin"
PATH="$PATH:/c/Users/julio/AppData/Local/Pub/Cache/bin"
PATH="$PATH:/c/Users/julio/AppData/Roaming/nvm"
PATH="$PATH:/c/Users/julio/AppData/Roaming/npm"
PATH="$PATH:/c/Users/julio/flutter/bin"
source .bash/.bashrc

# .bash\.bash_profile
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

# .bash\.bash_profile
declare -A ANDROID=(
    [ICON]="@mipmap/ic_launcher"
    [ID]="com.example.siat_mobile"
    [LABEL]="siat_mobile"
    [TITLE]="Flutter"
    [URI]=""
)
```

# Create Project

https://docs.flutter.dev/get-started/install/windows/mobile

```bash

# siat_mobile
flutter create siat_mobile
cd siat_mobile
```

```gradle

// siat_mobile\android\app\build_template.gradle
plugins {
    id "com.android.application"
    id "kotlin-android"
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id "dev.flutter.flutter-gradle-plugin"
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader("UTF-8") { reader ->
        localProperties.load(reader)
    }
}

def flutterVersionCode = localProperties.getProperty("flutter.versionCode")
if (flutterVersionCode == null) {
    flutterVersionCode = "1"
}

def flutterVersionName = localProperties.getProperty("flutter.versionName")
if (flutterVersionName == null) {
    flutterVersionName = "1.0"
}

android {
    namespace = "com.example.siat_mobile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "{{ID}}"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutterVersionCode.toInteger()
        versionName = flutterVersionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.debug
        }
    }
}

flutter {
    source = "../.."
}
```

```xml

<!-- siat_mobile\android\app\src\main\AndroidManifest_template.xml -->
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application
        android:label="{{LABEL}}"
        android:name="${applicationName}"
        android:icon="{{ICON}}">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:taskAffinity=""
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- Specifies an Android theme to apply to this Activity as soon as
                 the Android process has started. This theme is visible to the user
                 while the Flutter UI initializes. After that, this theme continues
                 to determine the Window background behind the Flutter UI. -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    <!-- Required to query activities that can process text, see:
         https://developer.android.com/training/package-visibility and
         https://developer.android.com/reference/android/content/Intent#ACTION_PROCESS_TEXT.

         In particular, this is used by the Flutter engine in io.flutter.plugin.text.ProcessTextPlugin. -->
    <queries>
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>
```

```dart

// siat_mobile\android\app\build_template.gradle
plugins {
    id "com.android.application"
    id "kotlin-android"
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id "dev.flutter.flutter-gradle-plugin"
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file("local.properties")
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader("UTF-8") { reader ->
        localProperties.load(reader)
    }
}

def flutterVersionCode = localProperties.getProperty("flutter.versionCode")
if (flutterVersionCode == null) {
    flutterVersionCode = "1"
}

def flutterVersionName = localProperties.getProperty("flutter.versionName")
if (flutterVersionName == null) {
    flutterVersionName = "1.0"
}

android {
    namespace = "com.example.siat_mobile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "{{ID}}"
        // You can update the following values to match your application needs.
        // For more information, see: https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutterVersionCode.toInteger()
        versionName = flutterVersionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.debug
        }
    }
}

flutter {
    source = "../.."
}
```
