import 'dart:async';
import 'dart:io' show Platform;

import 'package:eneler_mariia/src/features/application/widgets/navigation_widget.dart';
import 'package:eneler_mariia/src/features/authentication/data/data_sources/external/google_auth.dart';
import 'package:eneler_mariia/src/features/authentication/presentation/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// {@template auth_listener}
/// AuthListener widget.
/// {@endtemplate}
class AuthListener extends StatelessWidget {
  /// {@macro auth_listener}
  AuthListener({super.key});

  final googleInstance = GoogleAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return StreamBuilder<GoogleSignInAccount?>(
          stream: googleInstance.userStateChanges,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return NavigationWidget();
            }
            return AuthScreen();
          });
    }
    return Scaffold();
  }
}
