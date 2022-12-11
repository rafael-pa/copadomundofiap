import 'package:copadomundofiap/components/inner_text.dart';
import 'package:copadomundofiap/components/my_scaffold.dart';
import 'package:copadomundofiap/screens/main_screen.dart';
import 'package:copadomundofiap/screens/signup_screen.dart';
import 'package:copadomundofiap/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:copadomundofiap/components/rounded_button.dart';
import 'package:copadomundofiap/components/rounded_text_field.dart';
import 'package:material_color_generator/material_color_generator.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login';


  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      colors: const [Colors.black45, Colors.black87],
      stops: const [0.1, 0.4],
      body: tela(context),
    );
  }

  Widget tela(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      image: DecorationImage(
          image: const AssetImage("assets/images/khalifa_stadium.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(mainColor().withOpacity(0.35), BlendMode.dstATop)
        ),
      ),
      child:SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title("Hello!"),
                    loginForm(context),]
                )
              )
            ]
          )
      )
    );
  }
  
  Widget loginForm(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.only(
              left:16,
              top:24,
              right:16,
              bottom:24
          ),
          decoration: const BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputEmail(),
              inputSenha(),
              loginButton(context),
              const Padding(
                  padding: EdgeInsets.only(top:20), child: InnerText(text: "Don't have an account?")),
              signUpButton(context),
            ],
          ),
        ));
  }

  Widget title(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      child: Text(
          texto,
          style: GoogleFonts.montserrat(
              fontSize: 36, color: Colors.white, fontWeight: FontWeight.w700)),
    );
  }

  Widget inputEmail() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: RoundedTextField(
          label: "E-mail",
          onChanged: (valor) {email = valor;}
      ),
    );
  }

  Widget inputSenha() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: RoundedTextField(
            label: "Password",
            obscureText: true,
            onChanged: (valor) {senha = valor;}
        ),
    );
  }

  Widget loginButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: RoundedButton(
            label: "Login", onClick: () => executeLogin(context)));
  }

  Widget signUpButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: RoundedButton(
            label: "Sign Up", onClick: () => navigateToSignupScreen(context)));
  }

  Future<void> executeLogin(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: senha
      );
      if (!mounted) return;
      navigateToMainScreen(context);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast('No user found for this email.');
      } else if (e.code == 'wrong-password') {
        showToast('Wrong password provided for this user.');
      }
    }
  }

  void navigateToMainScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, MainScreen.id, (r) => false);
  }

  void navigateToSignupScreen(BuildContext context) {
    Navigator.pushNamed(context, SignupScreen.id);
  }
}
