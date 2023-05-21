import 'package:clubspace/login/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(Splash());

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadSplashAnimation();
  }

  Future<void> _loadSplashAnimation() async {
    await Future.delayed(Duration(seconds: 10));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Lottie.network(
          'https://assets5.lottiefiles.com/packages/lf20_sr6nrr2j.json',
          width: 200,
          height: 200,
          repeat: true,
          fit: BoxFit.contain,
          onLoaded: (composition) {},
        ),
      ),
    );
  }
}

