#!/bin/bash

# Load environment variables from .env file
source .env

# Function to handle the deployment process
deploy() {
    local flavor="$1"
    local dart_file="$2"

    echo "Pushing the app to $flavor for internal testing and TestFlight..."
    echo "========= PROCESS STARTED FOR Play Store ============"
    echo "==================================================="

    echo "======= Increasing build number in pubspec.yaml ========"
    flutter pub run pub_version_plus:main build

    echo "================ Building app bundle ==================="
    flutter build appbundle --flavor "$flavor" -t "$dart_file"

    echo "================ Navigating to Android folder ==================="
    cd android

    echo "================ Deploying to Google Play Store - Internal Test ==================="
    bundle exec fastlane android beta dev_or_prod:"$data"

    echo "================ Returning to the root folder ==================="
    cd ..

    echo "================ Building IPA ==================="
    flutter build ipa --flavor "$flavor" -t "$dart_file"

    echo "================ Sending it to App Store - TestFlight ==================="
    xcrun altool --upload-app --type ios -f build/ios/ipa/flutterbaseapp.ipa --apiKey $APPSTORE_APIKEY --apiIssuer $APPSTORE_APPISSUER
    
    echo "================ Deployment completed for $flavor ==================="
}

# Check the command-line argument
case "$1" in
    p)
        data="p"
        deploy "flutterbaseapp_prod" "lib/main_flutterbaseapp_prod.dart"
        ;;
    s)
        data="s"
        deploy "flutterbaseapp_stg" "lib/main_flutterbaseapp_stg.dart"
    ;;
    d)
        data="d"
        deploy "flutterbaseapp_dev" "lib/main_flutterbaseapp_dev.dart"
        ;;
    *)
        echo "Invalid input. Please use 'sh push.sh p' for production or 'sh push.sh s' for staging or 'sh push.sh d' for development."
        ;;
esac
