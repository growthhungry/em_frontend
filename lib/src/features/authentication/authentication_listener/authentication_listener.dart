import 'dart:io';

import 'package:eneler_mariia/src/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationListener extends StatefulWidget {
  const AuthenticationListener({super.key});

  @override
  State<AuthenticationListener> createState() => _AuthenticationListenerState();
}

class _AuthenticationListenerState extends State<AuthenticationListener> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _IOSAuthListener();
    }

    return _AndroidAuthListener();
  }
}

class _IOSAuthListener extends StatefulWidget {
  const _IOSAuthListener({super.key});

  @override
  State<_IOSAuthListener> createState() => _IOSAuthListenerState();
}

class _IOSAuthListenerState extends State<_IOSAuthListener> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _AndroidAuthListener extends StatefulWidget {
  const _AndroidAuthListener({super.key});

  @override
  State<_AndroidAuthListener> createState() => _AndroidAuthListenerState();
}

class _AndroidAuthListenerState extends State<_AndroidAuthListener> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GoogleSignInAccount?>(
        stream: googleAuthListener(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: Text('complted'),
              ),
            );
          }
          return const AuthenticationScreen();
        });
  }

  Stream<GoogleSignInAccount?> googleAuthListener() async* {
    yield* googleSignIn.onCurrentUserChanged;
  }
}
