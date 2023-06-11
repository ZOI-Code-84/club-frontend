import 'package:flutter/material.dart';

void main() {
  runApp(EventDetails());
}

class EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Event Details'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 24),
                Text(
                  'Event Title',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Event Date',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 8),
                    Text(
                      'Number of Attending People: 32',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 24),
                    Icon(Icons.share),
                    SizedBox(width: 8),
                    Text(
                      'Share',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        Future.delayed(Duration(seconds: 4), () {
                          Navigator.of(context).pop();
                        });
                        return AlertDialog(
                          title: Text('See you soon'),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  child: Text('Attending'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
