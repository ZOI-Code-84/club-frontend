import 'package:flutter/material.dart';

const double kSpacingUnit = 16.0;

void main() => runApp(Demo());

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    final Color hexColor = Color.fromARGB(255, 2, 2, 1);
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              width: 360,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/background_image.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomLeft,
                ),
              ),
            ),
            Positioned(
              top: kSpacingUnit * 4,
              width: 360,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: kSpacingUnit * 2,
                      backgroundImage: AssetImage("assets/avatar.jpg"),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Faruk Kadic',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        print('Edited');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF6BA71),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      child: Container(
                        width: 120,
                        height: 50,
                        child: const Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: EdgeInsets.only(top: 20),
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Icons.arrow_back),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                padding: EdgeInsets.only(top: 20),
                color: Colors.white,
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
            ),
            Positioned(
              top: kSpacingUnit * 21,
              width: 360,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Player',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Point Guard',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.mail_outline_outlined,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'dummyData@gmail.com',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '+387 259 19203',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child:  Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'dummyData@gmail.com',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
