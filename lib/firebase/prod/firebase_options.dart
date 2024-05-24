// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptionsPROD {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCOj3NDq2kwHjUSOxaOlT5ny4BQTVekoj4',
    appId: '1:153586664223:web:93a8bea33e63f2093c662a',
    messagingSenderId: '153586664223',
    projectId: 'flutterbaseapp-9d91c',
    authDomain: 'flutterbaseapp-9d91c.firebaseapp.com',
    storageBucket: 'flutterbaseapp-9d91c.appspot.com',
    measurementId: 'G-388M2R2J1E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4jMFl1e7b7Le42qm0iLTDamdAeGQhRzA',
    appId: '1:153586664223:android:63255658d05f30813c662a',
    messagingSenderId: '153586664223',
    projectId: 'flutterbaseapp-9d91c',
    storageBucket: 'flutterbaseapp-9d91c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxNCfL4sx4VJhYbCBRDCIQ6VFtkzxxhno',
    appId: '1:153586664223:ios:dcd7d6620c90dd473c662a',
    messagingSenderId: '153586664223',
    projectId: 'flutterbaseapp-9d91c',
    storageBucket: 'flutterbaseapp-9d91c.appspot.com',
    iosBundleId: 'com.eachut.flutterbaseapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxNCfL4sx4VJhYbCBRDCIQ6VFtkzxxhno',
    appId: '1:153586664223:ios:dcd7d6620c90dd473c662a',
    messagingSenderId: '153586664223',
    projectId: 'flutterbaseapp-9d91c',
    storageBucket: 'flutterbaseapp-9d91c.appspot.com',
    iosBundleId: 'com.eachut.flutterbaseapp',
  );
}
