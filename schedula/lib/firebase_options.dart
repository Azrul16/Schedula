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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxYN6svk13Y8ljs1eZY56PVdg52CPjerU',
    appId: '1:1028683149003:android:3c0502a97af302f40bb54e',
    messagingSenderId: '1028683149003',
    projectId: 'schedula-6bd5d',
    databaseURL: 'https://schedula-6bd5d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'schedula-6bd5d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC91GDBemLbaivXxAhkbG_SEVphedMeg_o',
    appId: '1:1028683149003:ios:04d8f29c1327a52d0bb54e',
    messagingSenderId: '1028683149003',
    projectId: 'schedula-6bd5d',
    databaseURL: 'https://schedula-6bd5d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'schedula-6bd5d.appspot.com',
    iosBundleId: 'com.example.schedula',
  );
}
