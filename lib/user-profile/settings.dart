import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () {
              // Handle Notifications Setting
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Account'),
            onTap: () {
              // Handle Account Setting
            },
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Privacy'),
            onTap: () {
              // Handle Privacy Setting
            },
          ),
          ListTile(
            leading: Icon(Icons.palette),
            title: Text('Appearance'),
            onTap: () {
              // Handle Appearance Setting
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
              // Handle Language Setting
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Support'),
            onTap: () {
              // Handle Help & Support Setting
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              // Handle About Setting
            },
          ),
        ],
      ),
    );
  }
}
