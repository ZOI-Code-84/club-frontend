import 'package:clubspace/post/post_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HorizontalSwipper());
}

class HorizontalSwipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HorizontalPager(
        children: [
          FacebookPost(),
          FacebookPost(),
          FacebookPost(),
        ],
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final Color color;
  final String text;

  const CustomWidget({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HorizontalPager extends StatefulWidget {
  final List<Widget> children;

  const HorizontalPager({required this.children});

  @override
  _HorizontalPagerState createState() => _HorizontalPagerState();
}

class _HorizontalPagerState extends State<HorizontalPager> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            // Swiped from left to right
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          } else if (details.primaryVelocity! < 0) {
            // Swiped from right to left
            if (_currentPage < widget.children.length - 1) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }
        },
        child: PageView(
          controller: _pageController,
          children: widget.children,
          onPageChanged: _onPageChanged,
        ),
      ),
    );
  }
}

