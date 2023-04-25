import 'package:clubspace/homepage/homepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterSplashScreen.scale(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlueAccent,
            Colors.blue,
          ],
        ),
        childWidget: SizedBox(
          height: 50,
          child: Image.asset("assets/saturn.png"),
        ),
        duration: const Duration(milliseconds: 2000),
        animationDuration: const Duration(milliseconds: 1000),
        defaultNextScreen: const HomePage(),
      ),
    );
  }
}
