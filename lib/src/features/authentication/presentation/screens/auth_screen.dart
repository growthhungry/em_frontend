import 'package:eneler_mariia/src/common/dependencies/dependencies.dart';
import 'package:eneler_mariia/src/features/authentication/data/data_sources/external/google_auth.dart';
import 'package:eneler_mariia/src/features/authentication/presentation/bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template auth_screen}
/// AuthScreen widget.
/// {@endtemplate}
class AuthScreen extends StatefulWidget {
  /// {@macro auth_screen}
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final auth = GoogleAuth.instance;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: Dependencies.of(context).authBloc,
      listener: (context, state) {
        if (state is AuthCompleted) {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Card(
                  child: Text('Auth completed ${state.user.email}'),
                );
              });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: (state is AuthProcessing)
                      ? null
                      : () {
                          Dependencies.of(context)
                              .authBloc
                              .add(LogInViaGoogle());
                        },
                  child: const Text('login via google')),
              ElevatedButton(
                  onPressed: () {
                    Dependencies.of(context).authDataSources.googleSignOut();
                  },
                  child: const Text('log out'))
            ],
          )),
        );
      },
    );
  }
}
