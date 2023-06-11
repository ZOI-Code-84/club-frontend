import 'package:flutter/material.dart';

void main() {
  runApp(Students());
}

class Member {
  final String username;
  final String avatar;
  final bool isActive;

  Member({
    required this.username,
    required this.avatar,
    required this.isActive,
  });
}

class Students extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MemberListScreen(),
    );
  }
}

class MemberListScreen extends StatelessWidget {
  final List<Member> members = [
    Member(
      username: 'John',
      avatar: 'assets/avatar1.png',
      isActive: true,
    ),
    Member(
      username: 'Emily',
      avatar: 'assets/avatar2.png',
      isActive: false,
    ),
    Member(
      username: 'Daniel',
      avatar: 'assets/avatar3.png',
      isActive: true,
    ),
    Member(
      username: 'Sophia',
      avatar: 'assets/avatar4.png',
      isActive: true,
    ),
    Member(
      username: 'William',
      avatar: 'assets/avatar5.png',
      isActive: false,
    ),
    Member(
      username: 'Olivia',
      avatar: 'assets/avatar6.png',
      isActive: true,
    ),
    Member(
      username: 'James',
      avatar: 'assets/avatar7.png',
      isActive: true,
    ),
    Member(
      username: 'Ava',
      avatar: 'assets/avatar8.png',
      isActive: false,
    ),
    Member(
      username: 'Benjamin',
      avatar: 'assets/avatar9.png',
      isActive: true,
    ),
    Member(
      username: 'Emma',
      avatar: 'assets/avatar10.png',
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member List'),
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(member.avatar),
              backgroundColor: member.isActive ? Colors.green : Colors.red,
            ),
            title: Text(member.username),
            subtitle: Text(member.isActive ? 'Active' : 'Inactive'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailScreen(member: member),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MemberDetailScreen extends StatelessWidget {
  final Member member;

  MemberDetailScreen({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(member.avatar),
              backgroundColor: member.isActive ? Colors.green : Colors.red,
              radius: 50.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Username: ${member.username}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Status: ${member.isActive ? 'Active' : 'Inactive'}',
              style: TextStyle(fontSize: 16.0),
            ),
            // Add more details about the member here...
          ],
        ),
      ),
    );
  }
}
