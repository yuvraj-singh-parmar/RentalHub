import 'package:flutter/material.dart';
import 'package:loginsignup/presentation/screens/auth/login_screen.dart';
import 'package:loginsignup/presentation/screens/auth/register_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
  '/register': (context) => const RegisterScreen(),
  '/login': (context) => const MyLogin(),
  },
    ),
  );
}
