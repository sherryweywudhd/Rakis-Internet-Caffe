import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';

class RakiSplashScreen extends StatefulWidget {
  const RakiSplashScreen({super.key});

  @override
  State<RakiSplashScreen> createState() => _RakiSplashScreenState();
}

class _RakiSplashScreenState extends State<RakiSplashScreen> {
  bool _showGradient = false;

  @override
  void initState() {
    super.initState();
    // Transition to gradient after 2 seconds
    Timer(const Duration(seconds: 2), () {
      if (mounted) setState(() => _showGradient = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const KioskHomeScreen()),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          width: double.infinity,
          decoration: BoxDecoration(
            color: _showGradient ? null : Colors.black,
            gradient: _showGradient
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF2ECC71),
                      Color(0xFF1B5E20),
                      Colors.black,
                    ],
                  )
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset('assets/logo.png', height: 100),
              ),
              const SizedBox(height: 20),
              const Text(
                "Raki's Internet Cafe",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (_showGradient) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                  child: Text(
                    "Where Great Work Meets Great Snacks",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
                const Spacer(),
                const Text(
                  "Tap Anywhere to begin",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Icon(Icons.touch_app, color: Colors.white, size: 30),
                const SizedBox(height: 50),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
