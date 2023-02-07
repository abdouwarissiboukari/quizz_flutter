import 'package:flutter/material.dart';
import 'package:quizz/pages/Home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final Color primaryColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
