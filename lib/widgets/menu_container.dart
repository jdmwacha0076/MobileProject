import 'package:flutter/material.dart';

class NavigationDrawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40), // Adjust top padding to leave space for notifications, network bar, and time
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              'Choose Option',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          buildListTile(context, 'HomePage', Icons.home, '/home'),
          buildListTile(context, 'Register Product', Icons.add_box, '/register'),
          buildListTile(context, 'View Stocks Page', Icons.add_box, '/viewstocks'),
          buildListTile(context, 'Update Stocks Page', Icons.add_box, '/updatestocks'),
          // Add more list tiles for other pages
        ],
      ),
    );
  }

  Widget buildListTile(BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon), // Add icon to the left of the title
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.pushReplacementNamed(context, route); // Navigate to the specified route
      },
    );
  }
}
