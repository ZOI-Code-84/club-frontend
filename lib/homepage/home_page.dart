import 'package:clubspace/chart/charts.dart';
import 'package:clubspace/login/Login.dart';
import 'package:clubspace/members/members-list.dart';
import 'package:clubspace/pager/horizontal_pager.dart';
import 'package:clubspace/post/events-page.dart';
import 'package:clubspace/user-profile/settings.dart';
import 'package:clubspace/user-profile/user-profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../admin-page/event.fill-out.dart';


void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  final String? username;

  HomePage({this.username});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF8294C4),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFFEAD2)),
      ),
      home: DrawerDesign(username: username),
      routes: {
        '/page1': (context) => ProfilePage(),
        '/page2': (context) => EventList(),
        '/page3': (context) => SettingsScreen(),
        '/page4': (context) => LoginScreen(),
        '/page5': (context) => Students(),
        '/page6': (context) => ChartWidget(),
        '/page7': (context) => EventCreationScreen(),
      },
    );
  }
}

class DrawerDesign extends StatelessWidget {
  final String? username;

  DrawerDesign({this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        backgroundColor: Colors.blueAccent,
        activeIcon: Icons.close,
        elevation: 8,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            child: Icon(Icons.event),
            label: 'Add Event',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/page7');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.person),
            label: 'Add User',
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/page5');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.settings),
            label: 'Settings',
            onTap: () {

                Navigator.pop(context);
                Navigator.pushNamed(context, '/page3');

            },
          ),
        ],
      ),
    appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Open user profile
            },
            icon: Image.network(
              'https://user-images.githubusercontent.com/76163793/238213673-8d146dfe-a095-4846-8533-76cbec0c3cae.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://user-images.githubusercontent.com/76163793/238204789-366ab0d1-de84-4642-ab3f-25672f3205b8.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage: NetworkImage(
                              'https://avatars.githubusercontent.com/u/76163793?s=400&u=b008cb3721c90249cea73751922902b365775e7b&v=4'),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          username ?? 'Guest',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('User Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/page1');
              },
            ),
            ListTile(
              leading: Icon(Icons.signpost_outlined),
              title: Text('Club posts'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/page2');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/page3');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/page4');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://user-images.githubusercontent.com/76163793/238213673-8d146dfe-a095-4846-8533-76cbec0c3cae.png',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  username ?? 'Guest',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/page2'),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Events',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/page1'),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/page5'),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Students',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/page6'),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.query_stats,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Stats',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(100, 25, 0, 0),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Upcoming Events',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/page2'),
                child: Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event,
                        color: Colors.white,
                        size: 50,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Events',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(100, 25, 0, 0),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Latest Posts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Container(
              width: 350,
              height: 276,
              child: HorizontalSwipper(),
            ),
            Container(
              width: 350,
              height: 276,
              child: ChartWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
