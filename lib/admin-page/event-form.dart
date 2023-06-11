import 'package:flutter/material.dart';

void main() => runApp(EventScreen());

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Event Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/event_banner.jpg',
                fit: BoxFit.cover,
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Event Title',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Date: September 15, 2023',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Time: 6:00 PM - 9:00 PM',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Location: XYZ Convention Center',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Event Description',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                          'Suspendisse ultrices libero nec nisl aliquam, ut congue '
                          'odio pulvinar. Mauris maximus massa vitae dapibus '
                          'ultrices. Morbi volutpat justo sed mauris faucibus, at '
                          'eleifend ex varius. Sed sit amet lectus non risus gravida '
                          'molestie. Integer et nisl sapien.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Event Organizer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Organizer Name',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Speakers/Performers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Speaker 1',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Speaker 2',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Schedule',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Session 1 - 10:00 AM to 11:30 AM',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Session 2 - 12:00 PM to 1:30 PM',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Handle RSVP/Registration button press
                      },
                      child: Text('RSVP / Register'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Share this event',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Handle social sharing for Facebook
                          },
                          icon: Icon(Icons.facebook),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle social sharing for Twitter
                          },
                          icon: Icon(Icons.border_inner_rounded),
                        ),
                        IconButton(
                          onPressed: () {
                            // Handle social sharing for Instagram
                          },
                          icon: Icon(Icons.verified_user),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Venue Map',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Display venue map or directions
                    // You can use a package like 'flutter_map' or 'google_maps_flutter'
                    // to embed a map or show directions to the event venue.
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Email: contact@example.com',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                'Phone: +1 123-456-7890',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

