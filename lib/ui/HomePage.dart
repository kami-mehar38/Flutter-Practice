import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './Goals.dart';
import './Notifications.dart';
import './Settings.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  /// current index selected by the navigation bar
  int _currentIndex = 0;

  /// container pages for different navigation item
  final _pages = [Goals(), Notifications(), Settings()];

  /// creating the instance of Page Controller
  PageController _controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// overridden method to dispose the PageController instance see(_controller)
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        reverse: false,
        onPageChanged: (currentPage) {
          setState(() {
            _currentIndex = currentPage;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFFEfABA8),
            blurRadius: 6,
            spreadRadius: 0.2,
            offset: Offset(0, -2),
          ),
        ]),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFD72D27),
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFFEfABA8),
          selectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.adjust),
              title: Text("Goals"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text("Notifications"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onTapMenuItem,
        ),
      ),
    );
  }

  /// This function is selects the current item of navigation bar
  /// and move the page view to current index
  /// -parameter: index
  void _onTapMenuItem(int index) {
    setState(() {
      _currentIndex = index;
      _controller.jumpToPage(index);
    });
  }
}
