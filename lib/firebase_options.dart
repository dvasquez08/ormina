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
    apiKey: 'AIzaSyA87CQ9vu2GIHjYPL7eNcld4GT53oOxSew',
    appId: '1:769565576287:web:4dde6b37d8bf626608dfea',
    messagingSenderId: '769565576287',
    projectId: 'ai-meeting-app',
    authDomain: 'ai-meeting-app.firebaseapp.com',
    storageBucket: 'ai-meeting-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmgsaOpw-Ju37EDGw_Oqg0GNySM497oHg',
    appId: '1:769565576287:android:1e0d0cfd11f86bd808dfea',
    messagingSenderId: '769565576287',
    projectId: 'ai-meeting-app',
    storageBucket: 'ai-meeting-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIJDW0ShvXJCTMD-SeShnNFRN-Vi9gJX0',
    appId: '1:769565576287:ios:005c87388814657708dfea',
    messagingSenderId: '769565576287',
    projectId: 'ai-meeting-app',
    storageBucket: 'ai-meeting-app.firebasestorage.app',
    iosBundleId: 'com.example.ormina',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCIJDW0ShvXJCTMD-SeShnNFRN-Vi9gJX0',
    appId: '1:769565576287:ios:005c87388814657708dfea',
    messagingSenderId: '769565576287',
    projectId: 'ai-meeting-app',
    storageBucket: 'ai-meeting-app.firebasestorage.app',
    iosBundleId: 'com.example.ormina',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA87CQ9vu2GIHjYPL7eNcld4GT53oOxSew',
    appId: '1:769565576287:web:858780c7835c222208dfea',
    messagingSenderId: '769565576287',
    projectId: 'ai-meeting-app',
    authDomain: 'ai-meeting-app.firebaseapp.com',
    storageBucket: 'ai-meeting-app.firebasestorage.app',
  );
}
