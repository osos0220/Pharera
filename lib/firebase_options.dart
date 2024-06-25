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
    apiKey: 'AIzaSyCDPgyZrqAfQLUQGh7SDpw0xOUpwVS6-Wc',
    appId: '1:337345392254:web:62726c250ee6974ac2722f',
    messagingSenderId: '337345392254',
    projectId: 'signup-login-93587',
    authDomain: 'signup-login-93587.firebaseapp.com',
    storageBucket: 'signup-login-93587.appspot.com',
    measurementId: 'G-PGFMN7DMC2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiaAhRyi3LRfsgq8t_-KxtLjJaolyt9K4',
    appId: '1:337345392254:android:be2b2d16d0c02b04c2722f',
    messagingSenderId: '337345392254',
    projectId: 'signup-login-93587',
    storageBucket: 'signup-login-93587.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBs97qnInrR-sg864j5br75F4S3TXwj2zI',
    appId: '1:337345392254:ios:a1bbd1c94ee77d68c2722f',
    messagingSenderId: '337345392254',
    projectId: 'signup-login-93587',
    storageBucket: 'signup-login-93587.appspot.com',
    iosBundleId: 'com.example.flutterApplication09',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBs97qnInrR-sg864j5br75F4S3TXwj2zI',
    appId: '1:337345392254:ios:a1bbd1c94ee77d68c2722f',
    messagingSenderId: '337345392254',
    projectId: 'signup-login-93587',
    storageBucket: 'signup-login-93587.appspot.com',
    iosBundleId: 'com.example.flutterApplication09',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCDPgyZrqAfQLUQGh7SDpw0xOUpwVS6-Wc',
    appId: '1:337345392254:web:7be205248855b99dc2722f',
    messagingSenderId: '337345392254',
    projectId: 'signup-login-93587',
    authDomain: 'signup-login-93587.firebaseapp.com',
    storageBucket: 'signup-login-93587.appspot.com',
    measurementId: 'G-QZKKG412H1',
  );

}