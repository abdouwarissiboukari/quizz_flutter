import 'package:flutter/material.dart';
import 'package:quizz/apppage.dart';

const Color appColor = Colors.deepOrange;
const Color textColor = Colors.white;
Color cardColr = Colors.orange.shade100;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final Color primaryColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppPage(),
    );
  }
}
