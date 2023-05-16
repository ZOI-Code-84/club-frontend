import 'dart:convert';
import 'package:clubspace/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LoginScreen());

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');

    final response = await http.post(
      Uri.parse('http://192.168.56.1:8080/api/auth/login'),
      body: jsonEncode(<String, String>{
        "email": data.name,
        "password": data.password
      }),
      encoding: Utf8Codec(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
    );

    print(response.body); // Print the response body instead of the whole response object

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      final token = responseBody['token'] as String?;
      return token;
    } else {
      return 'Invalid credentials';
    }
  }



  Future<String?> _signupUser(SignupData data) async {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');

    final response = await http.post(
      Uri.parse('YOUR_SIGNUP_API_ENDPOINT'),
      body: {'username': data.name, 'password': data.password},
    );

    if (response.statusCode == 200) {
      return null;
    } else {
      return 'Signup failed';
    }
  }

  Future<String> _recoverPassword(String name) async {
    debugPrint('Name: $name');

    final response = await http.post(
      Uri.parse('YOUR_RECOVER_PASSWORD_API_ENDPOINT'),
      body: {'username': name},
    );

    if (response.statusCode == 200) {
      return '';
    } else {
      return 'User not found';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: FlutterLogin(
          theme: LoginTheme(
            primaryColor: Colors.blueAccent,
            buttonTheme: LoginButtonTheme(
              backgroundColor: Colors.deepPurpleAccent,

            ),
          ),
          logo: AssetImage('assets/saturn.png'),
          onLogin: _authUser,
          onSignup: _signupUser,

          loginProviders: <LoginProvider>[
            LoginProvider(
              icon: FontAwesomeIcons.google,
              callback: () async {
                debugPrint('start google sign in');
                await Future.delayed(loginTime);
                debugPrint('stop google sign in');
                return null;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.phone,
              callback: () async {
                debugPrint('start phone sign in');
                await Future.delayed(loginTime);
                debugPrint('stop phone sign in');
                return null;
              },
            ),
          ],
          onSubmitAnimationCompleted: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          },
          onRecoverPassword: _recoverPassword,
        ),
      ),
    );
  }
}
