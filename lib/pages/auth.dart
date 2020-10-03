import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class AuthenticatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: LitAuth(
          config: AuthConfig(),
          onAuthFailure: (failure) {
            print('Auth Failure');
          },
          onAuthSuccess: () {
            print('Auth Success');
          },
        ),
      ),
    );
  }
}
