import 'package:fb_auth_bloc/pages/home_page.dart';
import 'package:fb_auth_bloc/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        print('listener: $state');
        if (state.authStatus == AuthStatus.unauthenticated) {
          Navigator.pushNamed(context, SignInPage.routeName);
        } else if (state.authStatus == AuthStatus.authenticated) {
          Navigator.pushNamed(context, HomePage.routeName);
        }
      },
      builder: (context, state) {
        print('builder: $state');
        return const Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    );
  }
}
