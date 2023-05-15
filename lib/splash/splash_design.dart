import 'package:clubspace/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(SplashScreen());

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
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
          child: Lottie.network(
            'https://assets5.lottiefiles.com/packages/lf20_sr6nrr2j.json',
            width: 200,
            height: 200,
            repeat: false,
            fit: BoxFit.contain,
            onLoaded: (composition) {},
          ),
        ),
      ),
    );
  }
}
