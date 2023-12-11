import 'package:flutter/material.dart';
import 'package:prag_assignment/pages/home_screen.dart';
import 'package:prag_assignment/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true
      ),
      home: LoginScreen(),
    );
  }
}
