# flutterbaseapp

Start making app with this template

this app has below items as primary setup with core files:

flutter_launcher_icons: ^0.13.1
flutter_flavorizr: ^2.2.3
pub_version_plus: ^1.1.0
cached_network_image: ^3.3.1
cached_network_svg_image: ^1.0.0
connectivity_widget: ^3.0.0
dio: ^5.4.3+1
feedback: ^3.1.0
firebase_crashlytics: ^3.5.6
flutter:
sdk: flutter
flutter_dotenv: ^5.1.0
flutter_local_notifications: ^17.1.2
flutter_localizations:
sdk: flutter
flutter_native_splash: ^2.4.0
flutter_svg: ^2.0.10+1
geolocator: ^12.0.0
get_storage: ^2.1.1
go_router: ^14.1.3
image_picker: ^1.1.1
jwt_decoder: ^2.0.1
loading_animation_widget: ^1.2.1
onesignal_flutter: ^5.2.0
permission_handler: ^11.3.1
persistent_bottom_nav_bar: ^5.0.2
responsive_sizer: ^3.3.1
url_launcher: ^6.2.6

# make this app your own

- clone this repo. Note: This app is not a full app, it is a template to start your app with,
- find all 'com.example.flutterbaseapp' and rename all to your bundle name(dont use space)
- Enter command 'flutterfire configure -o lib/firebase/dev/firebase_options.dart' to and choose dev having com.example.flutterbaseapp.dev project app, similarly Enter command 'flutterfire configure -o lib/firebase/stg/firebase_options.dart' to and choose stg having com.example.flutterbaseapp.stg and Enter command 'flutterfire configure -o lib/firebase/prod/firebase_options.dart' to and choose dev having com.example.flutterbaseapp.prod
- find all flutterbaseapp text in this project and rename all to your app name(dont use space)
- Replace 3 files with same name in firebase/dev, firebase/stg and firebase/prod folder. Support of android, ios and mac is already added to pubspec.yaml. Enter 'flutter pub run flutter_flavorizr' command on terminal to generate flavor for Dev, Stg, and Prod. This will help you build Firebase, crashlytic and analytic. Note: this app has 3 flavor. Dev, Stg, and Prod.
- OPTIONAL : if you get ext.kotlin_version = '<latest-version>' then, Inside settings.gradle file, find 'org.jetbrains.kotlin.android' and replace version number to latest.
- Replace 3 images with same name and format in assets/icon_generate folder to create icon. Enter 'flutter pub run flutter_launcher_icons' command on terminal to generate icons for individual flavors. Note: while generating icon using flutter_launcher_icons, circular icon is not created.
- Optional change color properties to app theme color in flutter_native_splash.yaml to make app launch stylish. Enter 'dart run flutter_native_splash:create' command on terminal to generate splash page.
- make .env file at root of this project and fill data like given in .env.example file

# Note

1. This app is not a full app, it is a template to start your app with
2. this app has 3 flavor. Dev, Stg, and Prod.
3. while generating icon using flutter_launcher_icons, circular icon is not created.
