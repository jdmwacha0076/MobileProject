import 'package:flutter/material.dart';

import '../../widgets/menu_container.dart';


class BatchStoreOpenPage extends StatelessWidget {
  final List<DataRow> selectedRows;

  BatchStoreOpenPage({required this.selectedRows});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomePage',
          style: TextStyle(
            fontWeight: FontWeight.bold,// Make the text bold
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.blue, // Set app bar color to blue
      ),
      drawer: Drawer(
        child: NavigationDrawers(), // Use NavigationDrawer here
      ),
      body: ListView.builder(
        itemCount: selectedRows.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Selected Row ${index + 1}'),
            // You can customize how selected rows are displayed here
          );
        },
      ),
    );
  }
}
