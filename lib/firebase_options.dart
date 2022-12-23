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
    apiKey: 'AIzaSyCe637dQvV27TlQPiJrMkQPaffxlSyoRVk',
    appId: '1:146699168008:web:588791dfc214d43bfa64bd',
    messagingSenderId: '146699168008',
    projectId: 'pokescoutor',
    authDomain: 'pokescoutor.firebaseapp.com',
    storageBucket: 'pokescoutor.appspot.com',
    measurementId: 'G-80B5DRN96L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDYx25xQC1gP7SV39aZSrmoBVWy7eCRLk4',
    appId: '1:146699168008:android:aebc66258b21c0dcfa64bd',
    messagingSenderId: '146699168008',
    projectId: 'pokescoutor',
    storageBucket: 'pokescoutor.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyAWtQ5rWSFEU7rFZ1PBzsU1JKcbBXpf4',
    appId: '1:146699168008:ios:d0fdcec6434b0dd9fa64bd',
    messagingSenderId: '146699168008',
    projectId: 'pokescoutor',
    storageBucket: 'pokescoutor.appspot.com',
    iosClientId: '146699168008-068sh66bmmseqa6v4ts5s4v1ohvkk0ks.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTemplate',
  );
}