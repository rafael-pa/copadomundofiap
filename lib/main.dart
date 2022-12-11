import 'package:copadomundofiap/screens/login_screen.dart';
import 'package:copadomundofiap/screens/main_screen.dart';
import 'package:copadomundofiap/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:copadomundofiap/screens/splash_screen.dart';
//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Copa do Mundo 2022',
      theme: myTheme,
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        SignupScreen.id: (context) => const SignupScreen(),
        MainScreen.id: (context) => MainScreen(),
    }
    );
  }

  ThemeData myTheme = ThemeData(
    primarySwatch: generateMaterialColor(color: const Color(0xFFb92d45)),
  );
}
