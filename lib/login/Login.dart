import 'dart:convert';
import 'package:clubspace/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LoginScreen());

String? authToken;

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  String? username;

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');

    final response = await http.post(
      Uri.parse('http://192.168.0.15:8080/api/auth/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'connection': 'keep-alive',
      },
      body: jsonEncode({
        'email': data.name,
        'password': data.password,
      }),
    );

    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        try {
          final Map<String, dynamic> responseBody = json.decode(response.body);

          if (responseBody.containsKey('token')) {
            final String? token = responseBody['token'] as String?;

            if (token != null) {
              authToken = token;
              username = data.name;
              return null;
            }
          }

          return 'Token not found in response';
        } catch (e) {
          print('Error decoding JSON response: $e');
          return 'Error decoding JSON response';
        }
      } else {
        return 'Empty response body';
      }
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
      home: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => Scaffold(
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(username: username),
                    ),
                  );
                },
                onRecoverPassword: _recoverPassword,
              ),
            ),
          );
        },
      ),
    );
  }
}
