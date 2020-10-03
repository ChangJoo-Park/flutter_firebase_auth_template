import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_firebase_template/pages/auth.dart';
import 'package:flutter_firebase_template/pages/home.dart';
import 'package:get/route_manager.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Container(
            child: Text('에러'),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return LitAuthInit(
            authProviders: AuthProviders(
              emailAndPassword: true,
              github: true,
              apple: true,
              google: true,
              twitter: true,
            ),
            child: GetMaterialApp(
              home: Scaffold(
                body: LitAuthState(
                  authenticated: HomePage(),
                  unauthenticated: AuthenticatePage(),
                ),
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
