import 'dart:async';

import 'package:copadomundofiap/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

import '../components/my_scaffold.dart';
import 'main_screen.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'splash';

  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => navegarParaLogin(context));
    return MyScaffold(
      body: tela(context),
    );
  }

  Widget tela(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [imagem()],
          ));
  }

  Widget imagem() {
    return Expanded(
        child: Image.asset('assets/images/logo_splash.png'));
  }

  void navegarParaLogin(BuildContext context) {
    Timer(const Duration(seconds: 2), ()
      {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, MainScreen.id, (r) => false);
        }
        else {
          Navigator.pushNamedAndRemoveUntil(
              context, LoginScreen.id, (r) => false);
        }
      }
    );
  }
}
