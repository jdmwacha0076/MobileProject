import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/menu_container.dart';

class AboutPage extends StatelessWidget {
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
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 110,
                backgroundImage: NetworkImage(
                  'https://jdmwacha0076.github.io/0/assets/img/me2.jpeg',
                ),
              ),
              SizedBox(height: 20),
              buildInfoTile(Icons.person, 'Jina: Joseph Mwacha'),
              buildInfoTile(Icons.phone, 'Tigo: 0656345149', onTap: () {
                _launchPhone('+255656345149');
              }),
              buildInfoTile(Icons.phone, 'Airtel: 0689345140', onTap: () {
                _launchPhone('+255689345140');
              }),
              buildInfoTile(Icons.email, 'Email: jmwacha0076@gmail.com', onTap: () {
                _launchURL('mailto:jmwacha0076@gmail.com');
              }),
              buildInfoTile(Icons.location_on, 'Makazi: Dar-es-Salaam Tanzania'),
              buildInfoTile(Icons.link, 'LinkedIn', subtitle: 'Bonyeza Hapa', onTap: () {
                _launchURL('https://www.linkedin.com/in/joseph-mwacha-173684227/');
              }),
              buildInfoTile(Icons.language, 'Tovuti', subtitle: 'Bonyeza Hapa', onTap: () {
                _launchURL('https://jdmwacha0076.github.io/0/');
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, {String? subtitle, Function()? onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle != null ? Text(
        subtitle,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
      ) : null,
      onTap: onTap,
    );
  }

  _launchPhone(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: AboutPage(),
  ));
}
