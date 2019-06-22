import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './Login.dart';
import './Signup.dart';

class LoginSignup extends StatefulWidget {
  @override
  _MyLoginSignupState createState() => _MyLoginSignupState();
}

class _MyLoginSignupState extends State<LoginSignup> {
  /// current index selected by the navigation bar
  int _currentIndex = 0;

  static final _logInPage = Login();
  static final _signUpPage = Signup();

  /// container pages for different navigation item
  final _pages = [_logInPage, _signUpPage];

  /// creating the instance of Page Controller
  PageController _controller;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle().copyWith(statusBarBrightness: Brightness.dark));

    _controller = PageController();
    
    _logInPage.setOnTapSignUp(onTapSignUp: () {
      _controller.animateToPage(1,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });

    _signUpPage.setOnTapLogIn(onTapLogIn: () {
      _controller.animateToPage(0,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
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
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex == 0) {
          return true;
        } else if (_currentIndex == 1) {
          _controller.animateToPage(0,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
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
