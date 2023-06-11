import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(ChartWidget());
}

class Member {
  final String name;

  Member({required this.name});
}

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatsScreen(),
    );
  }
}

class StatsScreen extends StatelessWidget {
  final List<charts.Series<EventData, String>> eventSeriesList = [
    charts.Series<EventData, String>(
      id: 'events',
      domainFn: (EventData event, _) => event.month,
      measureFn: (EventData event, _) => event.count,
      data: generateRandomEventData(6, Member(name: 'John')),
    ),
  ];

  final List<charts.Series<PostData, String>> postSeriesList = [
    charts.Series<PostData, String>(
      id: 'posts',
      domainFn: (PostData post, _) => post.month,
      measureFn: (PostData post, _) => post.count,
      data: generateRandomPostData(6, Member(name: 'John')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Events',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 200.0,
                child: charts.BarChart(
                  eventSeriesList,
                  animate: true,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Posts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 200.0,
                child: charts.BarChart(
                  postSeriesList,
                  animate: true,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Members Activity Voting Poll',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              VotingPoll(),
            ],
          ),
        ),
      ),
    );
  }
}

class EventData {
  final String month;
  final int count;
  final Member member;

  EventData(this.month, this.count, this.member);
}

class PostData {
  final String month;
  final int count;
  final Member member;

  PostData(this.month, this.count, this.member);
}

class VotingPoll extends StatefulWidget {
  @override
  _VotingPollState createState() => _VotingPollState();
}

class _VotingPollState extends State<VotingPoll> {
  List<Member> members = [
    Member(name: 'John'),
    Member(name: 'Emily'),
    Member(name: 'Daniel'),
    // Add more members here...
  ];

  int _selectedMemberIndex = -1;
  List<EventData>? _selectedEventData;
  List<PostData>? _selectedPostData;

  void _selectMember(int index) {
    setState(() {
      _selectedMemberIndex = index;
      if (_selectedMemberIndex >= 0 && _selectedMemberIndex < members.length) {
        final selectedMember = members[_selectedMemberIndex];
        _selectedEventData = generateRandomEventData(6, selectedMember);
        _selectedPostData = generateRandomPostData(6, selectedMember);
      } else {
        _selectedEventData = null;
        _selectedPostData = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < members.length; i++)
          VotingOption(
            optionNumber: i + 1,
            optionText: members[i].name,
            isSelected: _selectedMemberIndex == i,
            onTap: () => _selectMember(i),
          ),
        if (_selectedEventData != null && _selectedPostData != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16.0),
              Text(
                'Selected Member\'s Events',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 200.0,
                child: charts.BarChart(
                  [
                    charts.Series<EventData, String>(
                      id: 'events',
                      domainFn: (EventData event, _) => event.month,
                      measureFn: (EventData event, _) => event.count,
                      data: _selectedEventData!,
                    ),
                  ],
                  animate: true,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Selected Member\'s Posts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Container(
                height: 200.0,
                child: charts.BarChart(
                  [
                    charts.Series<PostData, String>(
                      id: 'posts',
                      domainFn: (PostData post, _) => post.month,
                      measureFn: (PostData post, _) => post.count,
                      data: _selectedPostData!,
                    ),
                  ],
                  animate: true,
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class VotingOption extends StatelessWidget {
  final int optionNumber;
  final String optionText;
  final bool isSelected;
  final VoidCallback onTap;

  const VotingOption({
    required this.optionNumber,
    required this.optionText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: isSelected ? Colors.green[200] : null,
      title: Text('Option $optionNumber'),
      subtitle: Text(optionText),
    );
  }
}

List<EventData> generateRandomEventData(int count, Member member) {
  final random = Random();
  return List.generate(count, (index) {
    final month = 'Month ${index + 1}';
    final count = random.nextInt(100);
    return EventData(month, count, member);
  });
}

List<PostData> generateRandomPostData(int count, Member member) {
  final random = Random();
  return List.generate(count, (index) {
    final month = 'Month ${index + 1}';
    final count = random.nextInt(200);
    return PostData(month, count, member);
  });
}
