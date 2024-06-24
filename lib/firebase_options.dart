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
    apiKey: 'AIzaSyA8os9MnZZ6_dfYZ7hGh0JM4Y8g6yEWzH8',
    appId: '1:6476250175:web:687f573fd93e69e1794c8a',
    messagingSenderId: '6476250175',
    projectId: 'chatapp-a9c45',
    authDomain: 'chatapp-a9c45.firebaseapp.com',
    storageBucket: 'chatapp-a9c45.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJR2XT_Wgr9MkL0pLdnzAc0VUH-9ZxbOQ',
    appId: '1:6476250175:android:680a2b48ca9e0639794c8a',
    messagingSenderId: '6476250175',
    projectId: 'chatapp-a9c45',
    storageBucket: 'chatapp-a9c45.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqRKrWHz35NwcMYK2VGqVEfR5PfDCO9B0',
    appId: '1:6476250175:ios:6ddc5f9c12de0f61794c8a',
    messagingSenderId: '6476250175',
    projectId: 'chatapp-a9c45',
    storageBucket: 'chatapp-a9c45.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqRKrWHz35NwcMYK2VGqVEfR5PfDCO9B0',
    appId: '1:6476250175:ios:6ddc5f9c12de0f61794c8a',
    messagingSenderId: '6476250175',
    projectId: 'chatapp-a9c45',
    storageBucket: 'chatapp-a9c45.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA8os9MnZZ6_dfYZ7hGh0JM4Y8g6yEWzH8',
    appId: '1:6476250175:web:c4721ede93f0d831794c8a',
    messagingSenderId: '6476250175',
    projectId: 'chatapp-a9c45',
    authDomain: 'chatapp-a9c45.firebaseapp.com',
    storageBucket: 'chatapp-a9c45.appspot.com',
  );
}