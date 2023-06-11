import 'package:flutter/material.dart';

void main() => runApp(EventCreationScreen());

class EventCreationScreen extends StatefulWidget {
  @override
  _EventCreationScreenState createState() => _EventCreationScreenState();
}

class _EventCreationScreenState extends State<EventCreationScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _organizerController = TextEditingController();
  TextEditingController _speakersController = TextEditingController();
  TextEditingController _scheduleController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _organizerController.dispose();
    _speakersController.dispose();
    _scheduleController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitEvent() {
    String title = _titleController.text;
    String date = _dateController.text;
    String time = _timeController.text;
    String location = _locationController.text;
    String description = _descriptionController.text;
    String organizer = _organizerController.text;
    String speakers = _speakersController.text;
    String schedule = _scheduleController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Created'),
          content: Text('Your event has been successfully created.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Pop the dialog
                _navigateToEventDetails(
                  title,
                  date,
                  time,
                  location,
                  description,
                  organizer,
                  speakers,
                  schedule,
                  email,
                  phone,
                ); // Navigate to the new screen
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToEventDetails(
      String title,
      String date,
      String time,
      String location,
      String description,
      String organizer,
      String speakers,
      String schedule,
      String email,
      String phone,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => EventDetailsScreen(
          title: title,
          date: date,
          time: time,
          location: location,
          description: description,
          organizer: organizer,
          speakers: speakers,
          schedule: schedule,
          email: email,
          phone: phone,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Event'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Event Title'),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: _timeController,
                  decoration: InputDecoration(labelText: 'Time'),
                ),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Event Description'),
                  maxLines: 4,
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _organizerController,
                  decoration: InputDecoration(labelText: 'Event Organizer'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _speakersController,
                  decoration: InputDecoration(labelText: 'Speakers/Performers'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _scheduleController,
                  decoration: InputDecoration(labelText: 'Schedule'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitEvent,
                  child: Text('Post Event'),
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
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EventDetailsScreen extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String location;
  final String description;
  final String organizer;
  final String speakers;
  final String schedule;
  final String email;
  final String phone;

  EventDetailsScreen({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.organizer,
    required this.speakers,
    required this.schedule,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Title: $title'),
              Text('Date: $date'),
              Text('Time: $time'),
              Text('Location: $location'),
              Text('Description: $description'),
              Text('Organizer: $organizer'),
              Text('Speakers/Performers: $speakers'),
              Text('Schedule: $schedule'),
              Text('Email: $email'),
              Text('Phone: $phone'),
            ],
          ),
        ),
      ),
    );
  }
}
