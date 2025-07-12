import 'package:flutter/material.dart';
import 'package:lissy_chair/views/welcome_page.dart';
import 'package:lissy_chair/views/login_page.dart';
import 'package:lissy_chair/views/home_page.dart';
import 'package:lissy_chair/views/reset_password_page.dart';
import 'package:lissy_chair/views/sign_up_page.dart';
import 'package:lissy_chair/views/under_construction_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lissy Chairs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/reset-password': (context) => const ResetPasswordPage(),
        '/home': (context) => const HomePage(),
        '/under-construction': (context) => const UnderConstructionPage(),
      },
    );
  }
}
