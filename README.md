
# FlutterBaseApp

## Description

FlutterBaseApp is a robust starting template designed to streamline the development process for Flutter applications. This template comes pre-configured with essential libraries and tools to help you quickly set up a project with multi-environment support, including Firebase integration for dev, staging, and production environments.

## Features

- Pre-configured Firebase setup for dev, staging, and production environments.
- Built-in support for state management using Bloc and Hydrated Bloc.
- Image handling with cached network images and SVG support.
- Connectivity status handling and feedback integration.
- Local notifications and app splash screens.
- Responsive design with persistent bottom navigation.

## Technologies Used

- **State Management**: Bloc, Hydrated Bloc
- **Networking**: Dio
- **Firebase**: Core, Analytics, Crashlytics
- **Notifications**: Flutter Local Notifications, OneSignal
- **Other Utilities**: Icons Launcher, Geolocator, Permission Handler, URL Launcher

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone <repository_url>
   ```
   > Note: This app is a template to kickstart your project, not a full application.

2. **Configure Firebase**:
   - Create Firebase projects for dev, staging, and production environments.
   - Replace the example project IDs with your Firebase project IDs:
     ```bash
     flutterfire configure \
     --project=<your_dev_project_id> \
     --out=lib/firebase/<dev_folder_name>/firebase_options.dart \
     --ios-bundle-id=<your_dev_bundle_id> \
     --android-app-id=<your_dev_bundle_id>
     ```
     Repeat for staging and production environments.

   - Add `google-services.json` to `android/app/src/dev`, `android/app/src/stg`, and `android/app/src/prod`.
   - Add `GoogleService-Info.plist` to `ios/Runner/dev`, `ios/Runner/stg`, and `ios/Runner/prod`.

3. **Set Up App Icons**:
   - Replace images in `assets/app_icon_generate` and run:
     ```bash
     dart run icons_launcher:create --flavor dev
     dart run icons_launcher:create --flavor stg
     dart run icons_launcher:create --flavor prod
     ```

4. **Configure Splash Screen** (Optional):
   - Modify `flutter_native_splash.yaml` as needed and run:
     ```bash
     dart run flutter_native_splash:create
     ```

5. **Environment Configuration**:
   - Create a `.env` file at the root of the project using `.env.example` as a reference.

6. **Run the App**:
   ```bash
   flutter run
   ```

## Usage Instructions

- **Customize the App**:
  - Rename package identifiers from `com.example.flutterbaseapp` to your own.
  - Update all occurrences of `flutterbaseapp` with your app's name.
  - Adjust Firebase initialization in `main.dart`.

- **Deploy to App Store**:
  - Configure `.env` with your `APPSTORE_APIKEY` and `APPSTORE_APPISSUER`.
  - Place the `.keystore` file in `lib/credential`.
  - Set up Fastlane and run:
    ```bash
    sh push.sh
    ```

## Notes

1. This app is a starting template, not a complete application.
2. It includes three flavors: Dev, Stg, and Prod.
3. Firebase, analytics, and crash reporting are pre-configured.

## Contributing

- Clone from the main branch.
- Make your changes and create a detailed Pull Request (PR).


 
 
# ---README FILE TEMPLETE BELOW--

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
