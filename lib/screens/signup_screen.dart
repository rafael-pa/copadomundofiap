import 'package:copadomundofiap/components/my_scaffold.dart';
import 'package:copadomundofiap/screens/main_screen.dart';
import 'package:copadomundofiap/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:copadomundofiap/components/rounded_button.dart';
import 'package:copadomundofiap/components/rounded_text_field.dart';
import 'package:material_color_generator/material_color_generator.dart';

class SignupScreen extends StatefulWidget {
  static const id = 'signup';


  const SignupScreen({
    super.key,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: tela(context),
      colors: const [Colors.black45, Colors.black87],
      stops: const [0.1, 0.4],
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        title("Sign up"),
                        signupForm(context),
                      ]
                  )
              )
            ]
        )
      )
    );
  }
  
  Widget signupForm(BuildContext context) {
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
              signUpButton(context)
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
            onChanged: (valor) {password = valor;}
        ),
    );
  }

  Widget signUpButton(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: RoundedButton(
            label: "Create Account", onClick: () => signUp(context)));
  }

  Future<void> signUp(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      if (!mounted) return;
      executeLogin(context);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      }
    } catch (e) {
      showToast(e.toString());
    }
  }

  Future<void> executeLogin(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if (!mounted) return;
      navigateToMainScreen(context);

    } catch (e) {
        showToast(e.toString());
    }
  }

  void navigateToMainScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, MainScreen.id, (r) => false);
  }
}
