import 'package:eneler_mariia/src/common/components/styles/text_styles.dart';
import 'package:eneler_mariia/src/features/application/dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../auhtentication_bloc/authentication_bloc.dart';

const _logoAsset = 'assets/icons/blue_logo.svg';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      bloc: Dependencies.of(context).authenticationBloc,
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const _Logo(),
                  const SizedBox(height: 10),
                  const _HeaderText(),
                  const SizedBox(height: 24),
                  ElevatedButton(
                      onPressed: () async {
                        Dependencies.of(context)
                            .authenticationBloc
                            .add(AuthWithGoogle());
                      },
                      child: const Row()),
                  ElevatedButton(
                      onPressed: () async {
                        await Dependencies.of(context)
                            .googleAuthDataSources
                            .logOut();
                      },
                      child: const Row()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Войти или зарегистрироваться',
      style: headerTextStyle,
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(_logoAsset);
  }
}
