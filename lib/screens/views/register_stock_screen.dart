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

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

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
            fontWeight: FontWeight.bold,// Make the text bold
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.blue, // Set app bar color to blue
      ),
      drawer: Drawer(
        child: NavigationDrawers(), // Use NavigationDrawer here
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 1.0),
                  child: Text(
                    'Sajili Item',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              buildLabel('Stock Name', Icons.label),
              SizedBox(height: 5),
              buildTextField(_stockNameController, fontWeight: FontWeight.normal), // Adjust font weight here
              SizedBox(height: 20),
              buildLabel('Stock Number', Icons.numbers),
              SizedBox(height: 5),
              buildTextField(_stockNumberController, fontWeight: FontWeight.bold), // Adjust font weight here
              SizedBox(height: 20),
              buildMediaUploadButton(),
              SizedBox(height: 20),
              buildCameraButton(),
              SizedBox(height: 20),
              if (_image != null)
                Image.file(
                  _image!,
                  height: 100,
                ),
              SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your form submission logic here
                    },
                    child: Row(
                      children: [
                        Icon(Icons.check),
                        SizedBox(width: 15),
                        Text(
                          'Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildTextField(TextEditingController controller, {FontWeight fontWeight = FontWeight.normal}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(fontWeight: fontWeight), // Apply font weight here
        decoration: InputDecoration.collapsed(
          hintText: 'Enter ${controller == _stockNameController ? 'Stock Name' : 'Stock Number'}',
        ),
      ),
    );
  }

  Widget buildMediaUploadButton() {
    return ElevatedButton(
      onPressed: () {
        getImage(ImageSource.gallery);
      },
      child: Row(
        children: [
          Icon(Icons.attach_file),
          SizedBox(width: 15),
          Text(
            'Upload Media',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 21),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget buildCameraButton() {
    return ElevatedButton(
      onPressed: () {
        getImage(ImageSource.camera);
      },
      child: Row(
        children: [
          Icon(Icons.camera_alt),
          SizedBox(width: 15),
          Text(
            'Open Camera',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 21),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterStockScreen(),
  ));
}
