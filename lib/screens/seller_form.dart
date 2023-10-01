import 'package:flutter/material.dart';

import 'image_picker.dart';

class SellerForm extends StatefulWidget {
  static const String id = 'Seller_id';

  @override
  _SellerFormState createState() => _SellerFormState();
}

class _SellerFormState extends State<SellerForm> {
  final _formKey = GlobalKey<FormState>();
  String selectedSemester = 'Sem 1'; // Default selected semester
  String selectedBranch = 'Computer'; // Default selected branch
  TextEditingController branchController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          title: Text(
            "Add some details",
            style: TextStyle(color: Colors.black),
          ),
          shape: Border(bottom: BorderSide(color: Colors.grey.shade300)),
        ),
        body: SingleChildScrollView(
          // Wrap your form with a SingleChildScrollView
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Book name"),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Book Title'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  // Semester Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedSemester,
                    onChanged: (newValue) {
                      setState(() {
                        selectedSemester = newValue!;
                      });
                    },
                    items: <String>[
                      'Sem 1',
                      'Sem 2',
                      'Sem 3',
                      'Sem 4',
                      'Sem 5',
                      'Sem 6',
                      'Sem 7',
                      'Sem 8',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Semester',
                    ),
                  ),
                  SizedBox(height: 20),
                  // Branch Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedBranch,
                    onChanged: (newValue) {
                      setState(() {
                        selectedBranch = newValue!;
                      });
                    },
                    items: <String>[
                      'Computer',
                      'IT',
                      'Chem',
                      'EXtc',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Branch',
                    ),
                  ),
                  SizedBox(height: 20),
                  // Price Input
                  TextFormField(
                    controller: priceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a price';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  // Description Input
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  // Image Picker Button
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ImagePickerWidget();
                          });
                    },
                    child: Text("Pick an Image"),
                  ),
                  // Display the picked image if available

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   // Form is valid, perform your action
                      //   print('Validated');
                      //   print('Selected Semester: $selectedSemester');
                      //   print('Selected Branch: $selectedBranch');
                      //   print('Price: ${priceController.text}');
                      //   print('Description: ${descriptionController.text}');
                      //
                      //   // Create a Firestore reference
                      //   // CollectionReference books =
                      //   //     FirebaseFirestore.instance.collection('books');
                      //
                      //   // Add a new document with the entered data, including the image URL
                      //   // await books.add({
                      //   //   'bookTitle': 'Book Title: ${priceController.text}',
                      //   //   'semester': selectedSemester,
                      //   //   'branch': selectedBranch,
                      //   //   'price': priceController.text,
                      //   //   'description': descriptionController.text,
                      //   //   // Save the image URL in Firestore
                      //   // });
                      //
                      //   // Navigate to a new page or show a success message
                      //   // You can add your navigation logic here
                      // }
                      //
                      // Get.to(() => UserReview());
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    branchController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}