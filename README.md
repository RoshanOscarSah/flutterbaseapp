# flutterbaseapp

Start making app with this template

this app has below items as primary setup with core files:

icons_launcher: ^2.1.7
flutter_flavorizr: ^2.2.3
pub_version_plus: ^1.1.0

bloc: ^8.1.4
cached_network_image: ^3.3.1
cached_network_svg_image: ^1.0.0
connectivity_widget: ^3.0.0
dio: ^5.4.3+1
feedback: ^3.1.0
firebase_analytics: ^10.10.7
firebase_core: ^2.31.1
firebase_crashlytics: ^3.5.7
flutter:
sdk: flutter
flutter_bloc: ^8.1.6
flutter_dotenv: ^5.1.0
flutter_local_notifications: ^17.1.2
flutter_localizations:
sdk: flutter
flutter_native_splash: ^2.4.0
flutter_svg: ^2.0.10+1
freezed_annotation: ^2.4.1
geolocator: ^12.0.0
get_storage: ^2.1.1
go_router: ^13.2.5
hydrated_bloc: ^9.1.5
image_picker: ^1.1.1
jwt_decoder: ^2.0.1
loading_animation_widget: ^1.2.1
onesignal_flutter: ^5.2.0
path_provider: ^2.1.3
permission_handler: ^11.3.1
persistent_bottom_nav_bar_v2: ^5.2.3
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

- Since above command add all your apps(android, ios, web, etc.) to your firebase project(flutterbaseapp-dev,flutterbaseapp-stg and flutterbaseapp-prod). Now go on individual project(project settings> general> your apps) and
  a - keep/replace google-services.json of three different project in android/app/src/dev, android/app/src/stg and android/app/src/prod. Note : all three file name should be google-services.json.
  b - keep/replace GoogleService-Info.plist of three different project in ios/Runner/dev, ios/Runner/stg and ios/Runner/prod. Note : all three file name should be GoogleService-Info.plist.

- In main.dart file change three names of Firebase.initializeApp according to firebaseprojectId name.

- Replace 3 images with same name and format in asset/app_icon_generate folder to create icon.

NOTE: try using JPG format images

```bash
dart run icons_launcher:create --flavor dev
```

```bash
dart run icons_launcher:create --flavor stg
```

```bash
dart run icons_launcher:create --flavor prod
```

Enter command on terminal to generate icons for individual flavors.

- Optional change color properties to app theme color in flutter_native_splash.yaml to make app launch stylish. Enter

```bash
dart run flutter_native_splash:create
```

command on terminal to generate splash page.

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
