import 'package:flutter/material.dart';
import 'package:mobileproject/screens/auth/login_screen.dart';

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
      initialRoute: '/login', // Set the initial route
      routes: {
        '/login': (context) => LoginScreen(), // Define routes
        // Other routes...
      },
    );
  }
}
