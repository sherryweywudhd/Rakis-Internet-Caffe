import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const RakiApp());

class RakiApp extends StatelessWidget {
  const RakiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const RakiSplashScreen(),
    );
  }
}
