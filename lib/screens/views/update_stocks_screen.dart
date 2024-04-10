import 'package:flutter/material.dart';

import '../../widgets/menu_container.dart';

class UpdateStocksPage extends StatefulWidget {
  @override
  _UpdateStocksPageState createState() => _UpdateStocksPageState();
}

class _UpdateStocksPageState extends State<UpdateStocksPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _data = [
    {
      'No.': 1,
      'Item': 'Item A',
      'Picture': 'Picture A',
      'Name': 'Name A',
      'Store': 'Store A',
      'Price': 10.0,
      'Registration': 'Registration A',
      'Registrar': 'Registrar A',
      'From': 'From A',
      'Concerned': 'Concerned A',
      'Balance': 5,
      'Value': 50.0,
      'Action': 'Action A',
    },
    {
      'No.': 2,
      'Item': 'Item B',
      'Picture': 'Picture B',
      'Name': 'Name B',
      'Store': 'Store B',
      'Price': 20.0,
      'Registration': 'Registration B',
      'Registrar': 'Registrar B',
      'From': 'From B',
      'Concerned': 'Concerned B',
      'Balance': 10,
      'Value': 200.0,
      'Action': 'Action B',
    },
    {
      'No.': 3,
      'Item': 'Item C',
      'Picture': 'Picture C',
      'Name': 'Name C',
      'Store': 'Store C',
      'Price': 30.0,
      'Registration': 'Registration C',
      'Registrar': 'Registrar C',
      'From': 'From C',
      'Concerned': 'Concerned C',
      'Balance': 15,
      'Value': 450.0,
      'Action': 'Action C',
    },
  ];

  List<Map<String, dynamic>> _filteredData = [];

  @override
  void initState() {
    super.initState();
    _filteredData = List.from(_data);
  }

  void _filterData(String value) {
    setState(() {
      _filteredData = _data.where((entry) {
        return entry.values.any((element) => element.toString().toLowerCase().contains(value.toLowerCase()));
      }).toList();
    });
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Update Stocks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      StockFilterForm(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
                child: SizedBox(
                  height: 40.0,
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterData,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: StockTable(data: _filteredData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StockTable extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const StockTable({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      dataTextStyle: TextStyle(fontSize: 17),
      columnSpacing: 40,
      columns: [
        DataColumn(label: Text('No.', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Item', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Picture', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Store', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Price', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Registration', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Registrar', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('From', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Concerned', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Balance', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Value', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: data.map((entry) {
        return DataRow(cells: [
          DataCell(Text(entry['No.'].toString())),
          DataCell(Text(entry['Item'].toString())),
          DataCell(Text(entry['Picture'].toString())),
          DataCell(Text(entry['Name'].toString())),
          DataCell(Text(entry['Store'].toString())),
          DataCell(Text(entry['Price'].toString())),
          DataCell(Text(entry['Registration'].toString())),
          DataCell(Text(entry['Registrar'].toString())),
          DataCell(Text(entry['From'].toString())),
          DataCell(Text(entry['Concerned'].toString())),
          DataCell(Text(entry['Balance'].toString())),
          DataCell(Text(entry['Value'].toString())),
          DataCell(Text(entry['Action'].toString())),
        ]);
      }).toList(),
    );
  }
}

class StockFilterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Date: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    DateFormField(
                      labelText: "",
                      initialValue: DateTime(2024, 1, 1),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "End Date: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    DateFormField(
                      labelText: "",
                      initialValue: DateTime.now(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Select Store",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        items: [],
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Implement your search functionality here
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DateFormField extends StatefulWidget {
  final String labelText;
  final DateTime initialValue;

  const DateFormField({
    Key? key,
    required this.labelText,
    required this.initialValue,
  }) : super(key: key);

  @override
  _DateFormFieldState createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialValue;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }
}
