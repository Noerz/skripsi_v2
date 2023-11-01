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
    apiKey: 'AIzaSyABccbyI_NkW6PHpxkCwlafPAvpUbpvtIM',
    appId: '1:124119695692:web:05ba42c9a3f2e36286cfe9',
    messagingSenderId: '124119695692',
    projectId: 'skripsi_v2-25b3e',
    authDomain: 'skripsi_v2-25b3e.firebaseapp.com',
    storageBucket: 'skripsi_v2-25b3e.appspot.com',
    measurementId: 'G-HNK2QT1TDD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDO15RzvX_ZX9cSpAs4tekWgdiFB6FH9KY',
    appId: '1:124119695692:android:bce007d722df51d486cfe9',
    messagingSenderId: '124119695692',
    projectId: 'skripsi_v2-25b3e',
    storageBucket: 'skripsi_v2-25b3e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3CoJi4I3a2SQbOYEyWqxhl1DRfx50sDs',
    appId: '1:124119695692:ios:e13a62d2db9aa5db86cfe9',
    messagingSenderId: '124119695692',
    projectId: 'skripsi_v2-25b3e',
    storageBucket: 'skripsi_v2-25b3e.appspot.com',
    iosClientId: '124119695692-ponfh7fdujtdu38h18ikhq8qfauejj0r.apps.googleusercontent.com',
    iosBundleId: 'com.example.skripsi_v2',
  );
}
