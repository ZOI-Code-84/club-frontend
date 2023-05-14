import 'package:flutter/material.dart';

void main() => runApp(CustomDrawer());

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrawerDesign(),
      routes: {
        '/page1': (context) => Page1(),
        '/page2': (context) => Page2(),
        '/page3': (context) => Page3(),
        '/page3': (context) => Page3(),
      },
    );
  }
}

class DrawerDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://user-images.githubusercontent.com/76163793/238204789-366ab0d1-de84-4642-ab3f-25672f3205b8.png'),
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
                            backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/76163793?s=400&u=b008cb3721c90249cea73751922902b365775e7b&v=4'),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Nihad Jusovic',
                            style: TextStyle(
                              color: Colors.white,
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
                leading: Icon(Icons.access_time_outlined),
                title: Text('Club Actions'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/page3');
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
                  Navigator.pushNamed(context, '/page3');
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('Welcome to the home page'),
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Center(
        child: Text('Welcome to Page 1'),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Text('Welcome to Page 2'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Center(
        child: Text('Welcome to Page 3'),
      ),
    );
  }
}
