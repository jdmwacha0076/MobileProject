import 'package:flutter/material.dart';
import 'package:mobileproject/widgets/menu_container.dart';

class RegisterStockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      drawer: Drawer(
        child: NavigationDrawers(), // Use NavigationDrawer here
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: AlwaysStoppedAnimation(45 / 360),
                  child: Icon(
                    Icons.store,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
          buildLinkContainer(
            icon: Icons.edit,
            text: 'Sasisha Items',
            description:
            'Bonyeza hapa kuweza kuongeza au kupunguza item(s) zako kwa kufanya Stock In au Stock Out.',
          ),
          buildLinkContainer(
            icon: Icons.delete,
            text: 'Badili / Futa Item',
            description:
            'Bonyeza hapa kuweza kubadilisha jina na picha ya item(s) au kuifuta kabisa katika mfumo.',
          ),
          // Add other link containers as necessary
        ],
      ),
    );
  }

  Widget buildLinkContainer({required IconData icon, required String text, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(description),
        ],
      ),
    );
  }
}
