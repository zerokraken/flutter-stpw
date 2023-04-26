import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LfRhKQlAAAAALwgK8U3ETd5Krmlct3XMd8g_54T',
      androidProvider: AndroidProvider.playIntegrity,
    );
