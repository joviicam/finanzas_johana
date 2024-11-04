import 'package:finanzas_johana/modules/auth/register.dart';
import 'package:finanzas_johana/modules/home/profile_screen.dart';
import 'package:finanzas_johana/navigation/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:finanzas_johana/modules/auth/login.dart';
import 'package:finanzas_johana/navigation/setPass1.dart';
import 'package:finanzas_johana/navigation/setPass2.dart';
import 'package:finanzas_johana/navigation/setPass3.dart';
import 'package:finanzas_johana/widgets/splash_screen.dart';
import 'package:finanzas_johana/modules/home/home_screen.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/setPass1': (context) => const Setpass1(),
        '/setPass2': (context) => const Setpass2(),
        '/setPass3': (context) => const Setpass3(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/register': (context) => const Register(),
        '/navigation': (context) => const Navigation(),
      },
    );
  }
}
