# flutterbaseapp

Start making app with this template

this app has below items as primary setup with core files:

flutter_launcher_icons: ^0.13.1
flutter_flavorizr: ^2.2.3
pub_version_plus: ^1.1.0

bloc: ^8.1.4
cached_network_image: ^3.3.1
cached_network_svg_image: ^1.0.0
connectivity_widget: ^3.0.0
dio: ^5.4.3+1
feedback: ^3.1.0
firebase_core: ^2.31.1
firebase_crashlytics: ^3.5.6
flutter:
sdk: flutter
flutter_bloc: ^8.1.5
flutter_dotenv: ^5.1.0
flutter_local_notifications: ^17.1.2
flutter_localizations:
sdk: flutter
flutter_native_splash: ^2.4.0
flutter_svg: ^2.0.10+1
freezed_annotation: ^2.4.1
geolocator: ^12.0.0
get_storage: ^2.1.1
go_router: ^14.1.3
hydrated_bloc: ^9.1.5
image_picker: ^1.1.1
jwt_decoder: ^2.0.1
loading_animation_widget: ^1.2.1
onesignal_flutter: ^5.2.0
path_provider: ^2.1.3
permission_handler: ^11.3.1
persistent_bottom_nav_bar: ^5.0.2
responsive_sizer: ^3.3.1
upgrader: ^10.3.0
url_launcher: ^6.2.6

# make this app your own

- clone this repo. Note: This app is not a full app, it is a template to start your app with,
- find all 'com.example.flutterbaseapp' and rename all to your bundle name(dont use space)
- find all flutterbaseapp text in this project and rename all to your app name(dont use space)
- Make firebase project of com.example.flutterbaseapp.dev, com.example.flutterbaseapp.stg, com.example.flutterbaseapp.prod on website to use firebase. Remember Project ID of 3 firebase project
  -Replace example project ID with yours dev project and Enter command for eg

  ```bash
   flutterfire configure \
  --project=flutterbaseapp-dev-app-e7e16 \
  --out=lib/firebase/dev/firebase_options.dart \
  --ios-bundle-id=com.cubit.flutterbaseapp.dev \
  --android-app-id=com.cubit.flutterbaseapp.dev
  ```

  -Replace example project ID with yours stg project and Enter command for eg

  ```bash
   flutterfire configure \
  --project=flutterbaseapp-stg-app-e7116 \
  --out=lib/firebase/stg/firebase_options.dart \
  --ios-bundle-id=com.cubit.flutterbaseapp.stg \
  --android-app-id=com.cubit.flutterbaseapp.stg
  ```

  -Replace example project ID with yours prod project and Enter command for eg

  ```bash
   flutterfire configure \
  --project=flutterbaseapp-prod-app-e7116 \
  --out=lib/firebase/prod/firebase_options.dart \
  --ios-bundle-id=com.cubit.flutterbaseapp.prod \
  --android-app-id=com.cubit.flutterbaseapp.prod
  ```

   <!-- 'flutterfire configure -o lib/firebase/dev/firebase_options.dart' to and choose dev having com.example.flutterbaseapp.dev project app, similarly Enter command 'flutterfire configure -o lib/firebase/stg/firebase_options.dart' to and choose stg having com.example.flutterbaseapp.stg and Enter command 'flutterfire configure -o lib/firebase/stg/firebase_options.dart' to and choose dev having com.example.flutterbaseapp.prod Rename all 3 firebase_options.dart class names to DefaultFirebaseOptionsDEV, DefaultFirebaseOptionsSTG and DefaultFirebaseOptionsPROD -->

- Replace 2 files(google-services.json and GoogleService-Info.plist) with same name in firebase/dev, firebase/stg and firebase/prod folder. You can download from firebase project. Support of android, ios and mac is already added to pubspec.yaml.

Note: Before creating flavor. backup main.dart and flavors.dart.

Enter

```bash
flutter pub run flutter_flavorizr
```

command on terminal to generate flavor for Dev, Stg, and Prod. This will help you build Firebase, crashlytic and analytic. Note: this app has 3 flavor. Dev, Stg, and Prod. Replace main.dart and flavors.dart.

if firebase not working manually keep google-services.json of three different project in android/app/src/dev, google-services.json in android/app/src/stg, google-services.json in android/app/src/prod.

- OPTIONAL : if you get ext.kotlin_version = '<latest-version>' then, Inside settings.gradle file, find 'org.jetbrains.kotlin.android' and replace version number to latest.

- Replace 3 images with same name and format in assets/icon_generate folder to create icon. Enter

NOTE: try using JPG format images

```bash
flutter pub run flutter_launcher_icons
```

command on terminal to generate icons for individual flavors. Note: while generating icon using flutter_launcher_icons, circular icon is not created.

NOTE : Go to ios/Runner/Assets.xcassets/ and Rename AppIcon-dev.appiconset folder to devAppIcon.appiconset. similarly AppIcon-stg.appiconset folder to stgAppIcon.appiconset and AppIcon-prod.appiconset folder to prodAppIcon.appiconset

- Optional change color properties to app theme color in flutter_native_splash.yaml to make app launch stylish. Enter 'dart run flutter_native_splash:create' command on terminal to generate splash page.

- make .env file at root of this project and fill data like given in .env.example file

-while Sending it to App Store put APPSTORE_APIKEY and APPSTORE_APPISSUER in .env file. also put .keystore inside lib/credential folder

# Note

1. This app is not a full app, it is a template to start your app with
2. this app has 3 flavor. Dev, Stg, and Prod.
3. while generating icon using flutter_launcher_icons, circular icon is not created.

---README FILE TEMPLETE--

# APP NAME

## Description

APP DESCRIPTION 3 sentence.

## Features

- User registration, login, and profile updates
- Image uploads
- AI-generated images based on user-uploaded images
- Download or share generated images
- Stripe payment integration
- Notifications via OneSignal

## Technologies Used

- Stripe Payment
- Hydrated Bloc
- Connectivity Widget
- OneSignal Notification

## Setup Instructions

1. **Clone the Repository**:

   ```bash
   git clone -b production <repository_url>

   ```

2. **Ensure Flutter is installed and working**:
   Note: this app was made with flutter version = 3.22.0.

   ```bash
   flutter doctor

   ```

3. **Create .env file in root project**:
   You can find env file content example in .env.example
4. **Run the app**:
   ```bash
   flutter run
   ```

## Usage Instructions

- Register: Create a new account by providing the required details.
- Login: Log in using your registered credentials.
- Payment: Complete the payment process through Stripe.
- Upload Images: Upload multiple images to generate AI-based avatars.
- Download/Share: Download or share the generated images.

## Contributing

- Pull from the production branch.
- Make your changes and create a well-documented Pull Request (PR) with a detailed description of the changes.

## License

APP NAME - AI Image Generation App

## Authors

- NAME1
- NAME2

## Contact Information

For any questions or support, please contact: Email
