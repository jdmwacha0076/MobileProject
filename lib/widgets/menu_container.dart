import 'package:flutter/material.dart';
import 'package:mobileproject/screens/views/aboutme_screen.dart';

import '../screens/auth/login_screen.dart';
import '../screens/views/homepage_screen.dart';
import '../screens/views/register_stock_screen.dart';
import '../screens/views/store_all_once_screen.dart';
import '../screens/views/update_stocks_screen.dart';
import '../screens/views/view_stocks_screen.dart';

class NavigationDrawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chagua Menu',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Container(
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              buildListTile(context, 'HomePage', Icons.home, '/home'),
              buildListTile(
                  context, 'Register Product', Icons.edit, '/register'),
              buildListTile(
                  context, 'Take Items Store', Icons.door_sliding_rounded,
                  '/store_all_once'),
              buildListTile(
                  context, 'View Stocks Page', Icons.remove_red_eye_rounded,
                  '/viewstocks'),
              buildListTile(
                  context, 'Update Stocks Page', Icons.edit_note_rounded,
                  '/updatestocks'),
              buildListTile(
                  context, 'About Page', Icons.person_pin,
                  '/about'),
              buildListTile(
                  context, 'Log Out', Icons.logout,
                  '/logout'),
              // Add more list tiles for other pages
              Spacer(), // Add a spacer to push the footer to the bottom
              Container(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Version: 1.7', // Replace with your version number
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Contact: 0656345149', // Replace with your contact number
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context, String title, IconData icon,
      String route) {
    return ListTile(
      leading: Icon(icon), // Add icon to the left of the title
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        switch (route) {
          case '/home':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageScreen()));
            break;
          case '/register':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterStockScreen()));
            break;
          case '/store_all_once':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StoreAllOnce()));
            break;
          case '/viewstocks':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ViewStocksPage()));
            break;
          case '/updatestocks':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UpdateStocksPage()));
            break;
          case '/logout':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
            break;
          case '/about':
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AboutPage()));
            break;
        // Add cases for any additional routes
          default:
          // Handle the case where the route is not recognized
            print('Route $route is not recognized');
        }
      },
    );
  }
}
