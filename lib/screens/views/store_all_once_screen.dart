import 'package:flutter/material.dart';

import '../../widgets/menu_container.dart';
import '../views/batchstore_open_screen.dart';
import '../../models/item.dart'; // Import Item class// Import BatchStoreOpenPage class

class StoreAllOnce extends StatefulWidget {
  @override
  _StoreAllOnceState createState() => _StoreAllOnceState();
}

class _StoreAllOnceState extends State<StoreAllOnce> {
  List<Item> _items = [
    Item(stockNumber: '001', stockName: 'Item 1', registeredBy: 'User A'),
    Item(stockNumber: '001', stockName: 'Item 1', registeredBy: 'User A'),
    Item(stockNumber: '001', stockName: 'Item 1', registeredBy: 'User A'),
    Item(stockNumber: '001', stockName: 'Item 1', registeredBy: 'User A'),
    Item(stockNumber: '001', stockName: 'Item 1', registeredBy: 'User A'),
  ];

  List<Item> _selectedItems = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Item> getFilteredItems(String searchText) {
    return _items.where((item) {
      final stockNumber = item.stockNumber.toLowerCase();
      final stockName = item.stockName.toLowerCase();
      final registeredBy = item.registeredBy.toLowerCase();
      final query = searchText.toLowerCase();
      return stockNumber.contains(query) ||
          stockName.contains(query) ||
          registeredBy.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stock Management',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: NavigationDrawers(),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 1.0),
              child: Text(
                'All Stocks of Yours',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: SizedBox(
              height: 40.0, // Adjust the height as needed
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {}); // Trigger rebuild to reflect filtered items
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8.0), // Adjust the vertical padding
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: DataTable(
                        headingTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        dataTextStyle: TextStyle(fontSize: 17),
                        columns: [
                          DataColumn(label: Text('')),
                          DataColumn(label: Text('Stock Number')),
                          DataColumn(label: Text('Stock Name')),
                          DataColumn(label: Text('Picture')),
                          DataColumn(label: Text('Registered By')),
                        ],
                        rows: getFilteredItems(_searchController.text)
                            .map(
                              (item) => DataRow(
                            cells: [
                              DataCell(
                                Checkbox(
                                  value: _selectedItems.contains(item),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value != null && value) {
                                        _selectedItems.add(item);
                                      } else {
                                        _selectedItems.remove(item);
                                      }
                                    });
                                  },
                                ),
                              ),
                              DataCell(Text(item.stockNumber)),
                              DataCell(Text(item.stockName)),
                              DataCell(Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[200],
                                ),
                              )),
                              DataCell(Text(item.registeredBy)),
                            ],
                          ),
                        ).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BatchStoreOpenPage(selectedItems: _selectedItems),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ), // Add a tick icon
                    label: Text(
                      'Choose Store for the Selected Items',
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
      // Your existing body content here...
    );
  }
}


