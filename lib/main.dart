import 'package:flutter/material.dart';
import 'package:hp_api_fetch/screens/splash_screen.dart';
import 'package:hp_api_fetch/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: Constants.appName,
      home: SplashScreen(),
    );
  }
}
