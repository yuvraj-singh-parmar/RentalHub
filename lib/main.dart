import 'package:flutter/material.dart';
import 'package:loginsignup/presentation/screens/auth/login_screen.dart';
import 'package:loginsignup/presentation/screens/auth/register_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => MyLogin(),
        'register': (context) => MyRegister(),
      },
    ),
  );
}
