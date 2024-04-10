import 'package:flutter/material.dart';
import 'package:mobileproject/screens/views/aboutme_screen.dart';
import 'package:mobileproject/screens/views/register_stock_screen.dart';
import 'package:mobileproject/screens/views/store_all_once_screen.dart';
import 'package:mobileproject/screens/views/update_stocks_screen.dart';
import 'package:mobileproject/screens/views/view_stocks_screen.dart';
import 'package:mobileproject/widgets/menu_container.dart';



class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stock Management',
            style: TextStyle(
            fontWeight: FontWeight.bold,// Make the text bold
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.blue, // Set app bar color to blue
      ),
      drawer: Drawer(
        child: NavigationDrawers(), // Use NavigationDrawer here
      ),
      body: Container(
        color: Color(0xFFF0F2F5), // Set background color
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          children: [
            buildLinkContainer(
              icon: Icons.edit,
              text: 'Sajili Item',
              description:
              'Bonyeza hapa kuweza kusajili item(s) zako.Usajili kwa item(s) hufanyika mara moja tu.',
              onTap: () {
                // Navigate to SasishaItemsScreen on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterStockScreen()),
                );
              },
            ),
            buildLinkContainer(
              icon: Icons.door_sliding_rounded,
              text: 'Fungulia Stoo kwa Pamoja',
              description:
              'Bonyeza hapa kuweza kufungulia item(s) zako stoo mpya kwa pamoja. Item(s) husajiliwa katika kila stoo kwa mara moja tu.',
              onTap: () {
                // Navigate to BadiliFutaItemsScreen on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StoreAllOnce()),
                );
              },
            ),
            buildLinkContainer(
              icon: Icons.remove_red_eye_rounded,
              text: 'Tazama Items',
              description:
              'Bonyeza hapa kuweza kutazama na kupata taarifa zaidi kuhusu item(s) zilizopo katika stoo.',
              onTap: () {
                // Navigate to SasishaItemsScreen on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewStocksPage()),
                );
              },
            ),
            buildLinkContainer(
              icon: Icons.app_registration_sharp,
              text: 'Sasisha Items',
              description:
              'Bonyeza hapa kuweza kuongeza au kupunguza item(s) zako kwa kufanya Stock In au Stock Out.',
              onTap: () {
                // Navigate to SasishaItemsScreen on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateStocksPage()),
                );
              },
            ),
            buildLinkContainer(
              icon: Icons.delete,
              text: 'Badili / Futa Item',
              description:
              'Bonyeza hapa kuweza kubadilisha jina na picha ya item(s) au kuifuta kabisa katika mfumo.',
              onTap: () {
                // Navigate to SasishaItemsScreen on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateStocksPage()),
                );
              },
            ),
            buildLinkContainer(
              icon: Icons.person_pin,
              text: 'Kuhusu',
              description:
              'Bonyeza hapa kuweza kuwasiliana na kupatiwa msaada wa kuboresha na kutumia mfumo huu.',
              onTap: () {
                // Navigate to SasishaItemsScreen on tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            // Add other link containers as necessary
          ],
        ),
      ),
    );
  }

  Widget buildLinkContainer({
    required IconData icon,
    required String text,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10), // Add space at the top
            Icon(
              icon,
              size: 35, // Set icon size to 16px
            ),
            SizedBox(height: 10), // Add space between icon and text
            Text(
              text,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial', // Apply Arial font family
              ),
            ),
            SizedBox(height: 10), // Add space between text and description
            Text(
              description,
              style: TextStyle(
                fontSize: 19,
                fontFamily: 'Arial',
              ),
              textAlign: TextAlign.center, // Align description to the center
            ),
          ],
        ),
      ),
    );
  }
}

