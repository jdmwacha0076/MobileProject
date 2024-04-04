import 'package:flutter/material.dart';

class NavigationDrawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.lightGreen,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        buildListTile(context, 'Home', '/home'),
        buildListTile(context, 'Register', '/register'),
        // Add more list tiles for other pages
      ],
    );
  }

  Widget buildListTile(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.pushReplacementNamed(context, route); // Navigate to the specified route
      },
    );
  }
}