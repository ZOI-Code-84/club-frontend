import 'package:flutter/material.dart';

void main() => runApp(ProfilePage(
  clubStatus: 'doeJ-100',
  memberSince: '2022-01-01',
  contactDetails: 'john.doe@example.com',
));

class ProfilePage extends StatefulWidget {
  final String? username;
  final String? clubStatus;
  final String? memberSince;
  final String? contactDetails;

  ProfilePage({
    this.username,
    this.clubStatus,
    this.memberSince,
    this.contactDetails,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditing = false;
  TextEditingController _clubStatusController = TextEditingController();
  TextEditingController _memberSinceController = TextEditingController();
  TextEditingController _contactDetailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _clubStatusController.text = widget.clubStatus ?? '';
    _memberSinceController.text = widget.memberSince ?? '';
    _contactDetailsController.text = widget.contactDetails ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Username: ${widget.username ?? 'Guest'}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _isEditing
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _clubStatusController,
                      decoration: InputDecoration(
                        labelText: 'Club username',
                        icon: Icon(Icons.star),
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(width: 8.0),
                        Text(
                          'Club Username: ${_clubStatusController.text}',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _isEditing
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _memberSinceController,
                      decoration: InputDecoration(
                        labelText: 'Member Since',
                        icon: Icon(Icons.calendar_today),
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(width: 8.0),
                        Text(
                          'Member Since: ${_memberSinceController.text}',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _isEditing
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _contactDetailsController,
                      decoration: InputDecoration(
                        labelText: 'Contact Details',
                        icon: Icon(Icons.email),
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 8.0),
                        Text(
                          'Contact Details: ${_contactDetailsController.text}',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  _isEditing
                      ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: 200.0,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isEditing = false;
                            });
                          },
                          child: Text('Save'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0,
                            ),
                            textStyle: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                  )
                      : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: 200.0,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isEditing = true;
                            });
                          },
                          child: Text('Edit Profile'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 12.0,
                            ),
                            textStyle: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
