import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'main.dart'; // Import the main file to access GenerativeAISample

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _navigateToHome();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 7));
    _goToHomeScreen();
  }

  void _goToHomeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => GenerativeAISample()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _goToHomeScreen,  // This allows skipping the splash screen on tap
        child: Center(
          child: SizedBox(
            width: 200, // Specify the desired width
            height: 200, // Specify the desired height
            child: Lottie.asset(
              'assets/hello.json',
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            ),
          ),
        ),
      ),
    );
  }
}
