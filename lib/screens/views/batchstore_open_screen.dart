import 'dart:convert'; // Import for decoding JSON
import 'package:flutter/material.dart';
import '../../widgets/menu_container.dart';
import '../../models/item.dart'; // Import Item class
import '../../services/store_api.dart'; // Import Item class

class BatchStoreOpenPage extends StatefulWidget {
  final List<Item> selectedItems;

  BatchStoreOpenPage({required this.selectedItems});

  @override
  _BatchStoreOpenPageState createState() => _BatchStoreOpenPageState();
}

class _BatchStoreOpenPageState extends State<BatchStoreOpenPage> {
  late Future<List<String>> futureStoreNames;
  var selectedStore;
  List<String> storeNames = []; // Declaring storeNames here

  @override
  void initState() {
    super.initState();
    futureStoreNames = fetchStoreNames();
  }

  Future<List<String>> fetchStoreNames() async {
    // Simulating JSON fetching
    String jsonText = '''{
      "store_names": ["Store A", "Store B", "Store C"]
    }''';

    // Decoding JSON
    Map<String, dynamic> data = json.decode(jsonText);
    List<String> names = List<String>.from(data['store_names']);

    return names;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stock Management',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: NavigationDrawers(),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 1.0),
                      child: Text(
                        'Take Items to Store',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Container for dropdown menu
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: DropdownButton<String>(
                      value: selectedStore,
                      hint: Text('Select Store Name'), // Placeholder text
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStore = newValue;
                        });
                      },
                      items: storeNames.map<DropdownMenuItem<String>>((String storeName) {
                        return DropdownMenuItem<String>(
                          value: storeName,
                          child: Text(storeName),
                        );
                      }).toList(),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      headingTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      dataTextStyle: TextStyle(fontSize: 17),
                      columns: [
                        DataColumn(label: Text('Stock Number')),
                        DataColumn(label: Text('Picture')),
                        DataColumn(label: Text('Stock Name')),
                        DataColumn(label: Text('Store')),
                        DataColumn(label: Text('Price')),
                      ],
                      rows: widget.selectedItems.map((item) {
                        return DataRow(cells: [
                          DataCell(Text(item.stockNumber)),
                          DataCell(Text('')), // Placeholder for picture column
                          DataCell(Text(item.stockName)),
                          DataCell(Text(selectedStore ?? 'No store selected')), // Display selected store or 'No store selected'
                          DataCell(Text('')), // Placeholder for price column
                        ]);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add logic for button onPressed event
                    },
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ), // Add a tick icon
                    label: Text(
                      'Take Selected Items to Store',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // background color
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
