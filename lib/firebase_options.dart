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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAar5ALVkWiXZanqzG_kgNUBIKETy4xL_U',
    appId: '1:726987576670:web:9cf65824e8d836bd6febcf',
    messagingSenderId: '726987576670',
    projectId: 'mad-cep-bookstore',
    authDomain: 'mad-cep-bookstore.firebaseapp.com',
    storageBucket: 'mad-cep-bookstore.appspot.com',
    measurementId: 'G-FQEMGTTQG1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxLXDTpiUeAbe-GnUPmXHQt2sBXLHLcHs',
    appId: '1:726987576670:android:9ea1ca21c2169f9b6febcf',
    messagingSenderId: '726987576670',
    projectId: 'mad-cep-bookstore',
    storageBucket: 'mad-cep-bookstore.appspot.com',
  );
}