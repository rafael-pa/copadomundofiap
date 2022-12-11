import 'dart:async';
import 'dart:developer';

import 'package:copadomundofiap/components/match_line.dart';
import 'package:copadomundofiap/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:copadomundofiap/api/model/matches_model.dart';

import '../api/api_service.dart';
import '../components/my_scaffold.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main';

  MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Match>> matches;

  static Future<List<Match>> getMatches() async {
    return await ApiService().getMatches();
  }

  // @override
  // void initState(){
  //   super.initState();
  //   matches = getMatches();
  // }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      stops: const [0.1, 0.4],
      title: Image.asset('assets/images/logo_text.png', height: 42,),
      actions: [logoutButton(context)],
      body: tela(context),
    );
  }

  Widget tela(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder<List<Match>>(
                    future: getMatches(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return MatchLine(match: snapshot.data![index]);
                            }
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }
                  )
                ],
            )
        )
      ]
    );
  }

  Widget imagem() {
    return Expanded(
        child: Image.asset('assets/images/laeeb.webp'));
  }

  Widget logoutButton(BuildContext context) {
    return Padding(
        padding:  const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {logout(context);},
          child: const Icon(
              Icons.logout_outlined
          ),
        )
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    navegarParaLogin(context);
  }

  void navegarParaLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (r) => false);
  }
}
