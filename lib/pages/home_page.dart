import 'package:fb_auth_bloc/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(SignoutRequestedEvent());
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: const Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
