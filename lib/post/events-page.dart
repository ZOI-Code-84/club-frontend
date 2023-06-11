import 'package:clubspace/post/event_details.dart';
import 'package:flutter/material.dart';

void main() => runApp(EventList());

class EventPost {
  final String image;
  final String title;
  final String description;

  EventPost({
    required this.image,
    required this.title,
    required this.description,
  });
}

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final List<EventPost> eventPosts = [
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 1',
      description: 'Short description for Event 1',
    ),
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 2',
      description: 'Short description for Event 2',
    ),
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 3',
      description: 'Short description for Event 3',
    ),
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 4',
      description: 'Short description for Event 4',
    ),
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 5',
      description: 'Short description for Event 5',
    ),
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 6',
      description: 'Short description for Event 6',
    ),
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 7',
      description: 'Short description for Event 7',
    ),
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 8',
      description: 'Short description for Event 8',
    ),
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 9',
      description: 'Short description for Event 9',
    ),
    EventPost(
      image:
      'https://burst.shopifycdn.com/photos/crowd-participating-at-event.jpg?width=1200&format=pjpg&exif=1&iptc=1',
      title: 'Event 10',
      description: 'Short description for Event 10',
    ),
  ];

  List<bool> attendingStatus = List<bool>.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Event Screen'),
        ),
        body: ListView.builder(
          itemCount: eventPosts.length,
          itemBuilder: (context, index) {
            final eventPost = eventPosts[index];
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, EventDetails() as String);

                },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      eventPost.image,
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                    SizedBox(height: 10),
                    Text(
                      eventPost.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      eventPost.description,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              attendingStatus[index] = !attendingStatus[index];
                            });
                          },
                          icon: Icon(Icons.thumb_up),
                          label: Text('Attending'),
                          style: ElevatedButton.styleFrom(
                            primary: attendingStatus[index]
                                ? Colors.green
                                : null,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle share button action
                          },
                          icon: Icon(Icons.share),
                          label: Text('Share'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
