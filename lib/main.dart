import 'package:flutter/material.dart';
import 'package:mobileproject/screens/auth/login_screen.dart';
import 'package:mobileproject/screens/views/homepage_screen.dart';
import 'package:mobileproject/screens/views/register_stock_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePageScreen(),
        '/register': (context) => RegisterStockScreen(),
        // Add more routes as necessary
      },
    );
  }
}

