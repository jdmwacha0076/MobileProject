import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobileproject/widgets/menu_container.dart';

class RegisterStockScreen extends StatefulWidget {
  @override
  _RegisterStockScreenState createState() => _RegisterStockScreenState();
}

class _RegisterStockScreenState extends State<RegisterStockScreen> {
  File? _image;
  TextEditingController _stockNameController = TextEditingController();
  TextEditingController _stockNumberController = TextEditingController();

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
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
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 1.0),
                child: Text(
                  'Register Item',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            buildLabel('Stock Name', Icons.label),
            SizedBox(height: 5),
            buildTextField(_stockNameController, 'Enter Stock Name'),
            SizedBox(height: 20),
            buildLabel('Stock Number', Icons.confirmation_number),
            SizedBox(height: 5),
            buildTextField(_stockNumberController, 'Enter Stock Number'),
            SizedBox(height: 20),
            buildMediaUploadButton(),
            SizedBox(height: 20),
            if (_image != null)
              Image.file(
                _image!,
                height: 100,
              ),
            SizedBox(height: 1.0),
            ElevatedButton.icon(
              onPressed: () {
                // Add logic to submit the item
              },
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ), // Add a tick icon
              label: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white, // Set text color to white
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // background color
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ],
    );
  }

  Widget buildTextField(TextEditingController controller, String placeholder) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration.collapsed(
          hintText: placeholder,
        ),
      ),
    );
  }

  Widget buildMediaUploadButton() {
    return ElevatedButton(
      onPressed: () {
        getImage();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.attach_file),
          SizedBox(width: 10),
          Text(
            'Upload Media',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterStockScreen(),
  ));
}
