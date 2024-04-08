import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class StoreAllOnce extends StatefulWidget {
  @override
  _StoreAllOnceState createState() => _StoreAllOnceState();
}

class _StoreAllOnceState extends State<StoreAllOnce> {
  TextEditingController _searchController = TextEditingController();
  List<String> _selectedStocks = [];

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Items Zako Zote',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 0),
              buildSearchInput(),
              SizedBox(height: 10),
              buildDataTable(),
              SizedBox(height: 10),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchInput() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Tafuta kwa kutumia namba ya item.',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
    );
  }

  Widget buildDataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Selected')),
          DataColumn(label: Text('Na:')),
          DataColumn(label: Text('Item')),
          DataColumn(label: Text('Picha')),
          DataColumn(label: Text('Jina')),
          DataColumn(label: Text('Aliyesajili')),
        ],
        rows: _sampleData.map((data) {
          bool selected = _selectedStocks.contains(data.stockId);
          return DataRow(
            cells: [
              DataCell(
                Checkbox(
                  value: selected,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value != null) {
                        if (value) {
                          _selectedStocks.add(data.stockId ?? ''); // Provide default value if null
                        } else {
                          _selectedStocks.remove(data.stockId ?? ''); // Provide default value if null
                        }
                      }
                    });
                  },
                ),
              ),
              DataCell(Text('${data.stockId ?? ''}')), // Provide default value if null
              DataCell(Text('${data.item ?? ''}')), // Provide default value if null
              DataCell(Image.network(data.imageUrl ?? '')), // Provide default value if null
              DataCell(Text('${data.jina ?? ''}')), // Provide default value if null
              DataCell(Text('${data.aliyesajili ?? ''}')), // Provide default value if null
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle submit action here
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.layers),
          SizedBox(width: 10),
          Text(
            'Peleka Stoo kwa Pamoja',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 21),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class SampleData {
  final String? stockId;
  final String? item;
  final String? imageUrl;
  final String? jina;
  final String? aliyesajili;

  SampleData({
    this.stockId,
    this.item,
    this.imageUrl,
    this.jina,
    this.aliyesajili,
  });
}


final List<SampleData> _sampleData = List.generate(
  10,
      (index) => SampleData(
    stockId: 'Na$index',
    item: 'Item$index',
    imageUrl: 'https://via.placeholder.com/150',
    jina: 'Jina$index',
    aliyesajili: 'Aliyesajili$index',
  ),
);

void main() {
  runApp(MaterialApp(
    home: StoreAllOnce(),
  ));
}
