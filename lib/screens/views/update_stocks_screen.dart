import 'package:flutter/material.dart';

import '../../widgets/menu_container.dart';

class UpdateStocksPage extends StatelessWidget {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Card(
                child: Column(
                  children: [
                    CardHeader(),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: StockFilterForm(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: StockTable(),
            ),
          ],
        ),
      ),
    );
  }
}

class StockTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Na:')),
          DataColumn(label: Text('Item')),
          DataColumn(label: Text('Picha')),
          DataColumn(label: Text('Jina')),
          DataColumn(label: Text('Stoo')),
          DataColumn(label: Text('Bei')),
          DataColumn(label: Text('Usajili')),
          DataColumn(label: Text('Msajili')),
          DataColumn(label: Text('Kutoka')),
          DataColumn(label: Text('Mhusika')),
          DataColumn(label: Text('Balance')),
          DataColumn(label: Text('Thamani')),
          DataColumn(label: Text('Item')),
        ],
        rows: [
          // Add your rows here
        ],
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Center(
          child: Text(
            "Sasisha Item(s) kwa ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class StockFilterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      // action: "{{ route('viewstocks.filter') }}",
      // method: "GET",
      child: Column(
        children: [
          DateFormField(
            labelText: "Tarehe ya kuanzia:",
            initialValue: DateTime(2024, 4, 1),
          ),
          DateFormField(
            labelText: "Tarehe ya mwisho:",
            initialValue: DateTime.now(),
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: "Chagua jina la stoo:",
            ),
            items: [],
            onChanged: (value) {},
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Boneyeza hapa baada ya kuchagua Stoo"),
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
    return ListTile(
      title: TextFormField(
        readOnly: true,
        controller: TextEditingController(
          text: _selectedDate.toString().substring(0, 10),
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }
}


