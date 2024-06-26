// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
class DefaultFirebaseOptions {
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
        return windows;
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
    apiKey: 'AIzaSyCoETNlTyTEg3iNdh5KDGMUjlefww1tXyM',
    appId: '1:504879824495:web:912bd90f6f083f17afd79a',
    messagingSenderId: '504879824495',
    projectId: 'flutter-project-5dcb5',
    authDomain: 'flutter-project-5dcb5.firebaseapp.com',
    storageBucket: 'flutter-project-5dcb5.appspot.com',
    measurementId: 'G-R58D5TE6J0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtKhJURAXOy9x0kRebpNPtjYmPMofwHKE',
    appId: '1:504879824495:android:1f0bb8a256f6d778afd79a',
    messagingSenderId: '504879824495',
    projectId: 'flutter-project-5dcb5',
    storageBucket: 'flutter-project-5dcb5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDHoXlcI5H9avjMrQYbVBuOgI-_JmEbw_E',
    appId: '1:504879824495:ios:478b77e49a3ec067afd79a',
    messagingSenderId: '504879824495',
    projectId: 'flutter-project-5dcb5',
    storageBucket: 'flutter-project-5dcb5.appspot.com',
    iosBundleId: 'com.example.zomatoSqfliteExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDHoXlcI5H9avjMrQYbVBuOgI-_JmEbw_E',
    appId: '1:504879824495:ios:478b77e49a3ec067afd79a',
    messagingSenderId: '504879824495',
    projectId: 'flutter-project-5dcb5',
    storageBucket: 'flutter-project-5dcb5.appspot.com',
    iosBundleId: 'com.example.zomatoSqfliteExample',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCoETNlTyTEg3iNdh5KDGMUjlefww1tXyM',
    appId: '1:504879824495:web:900dbcb1c78ac544afd79a',
    messagingSenderId: '504879824495',
    projectId: 'flutter-project-5dcb5',
    authDomain: 'flutter-project-5dcb5.firebaseapp.com',
    storageBucket: 'flutter-project-5dcb5.appspot.com',
    measurementId: 'G-PGT7R52429',
  );
}
